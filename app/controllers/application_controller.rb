class ApplicationController < ActionController::API
	# 全局禁用 Session
	before_action :destroy_session
	
	rescue_from Exception, with: :all_exception
	def all_exception exception
		logger.error do
			"ApplicationController all_exception #{exception}"
		end
		if Rails.env.production?
			render json: {status: 10, message: "Some Errors"}, status: :accepted
		else
			raise exception
		end
	end
	# 引入 render_json 方法组
	include Concerns::RenderJson
	# 引入 current_user
	include Concerns::CurrentUser
	# 引入 Helper
	include ApplicationHelper
	
	private
		def destroy_session
			request.session_options[:skip] = true
		end
end
