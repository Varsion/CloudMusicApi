module Concerns
	module CurrentUser
		def self.included base
			base.class_eval do
				helper_method :current_user
				helper_method :unauthenticated!
			end
		end
		# 从请求头中恢复用户（检验用户是否登陆
		def current_user
			if @current_user.present?
				@current_user
			end
			# Session HTTP是框架自动添加的
			user_string = request.get_header('HTTP_USER')
			# 认证请求头
			authorization = request.authorization
			
			begin
				user = User.find(user_string)
				if user && user.authenticated?("session", authorization)
					@current_user = user
					logger.debug do
						"ApplicationController current_user:#{@current_user}"
					end
				else
					logger.debug do
						"ApplicationController current_user:nil"
					end
				end
			rescue Exception => e
				logger.debug do
					"ApplicationController current_user error:#{e}"
				end
			end
			@current_user
		end
		
		# 返回 请先登陆
		def unauthenticated!
			render_json_and_code({status: ERROR_UNAUTHORIZED, message: ERROR_UNAUTHORIZED_MESSAGE}, :unauthorized)
		end
		
		def authenticate_user!
			unauthenticated! unless current_user
		end
	end
end