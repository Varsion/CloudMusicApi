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
	# success
	def render_success data
		render json: data, status: :ok
	end
	
	# errors
	def render_error code, message
		render json: {status: code, message: message}
	end
	
	# default errors
	def render_default_error
		render_error(20, "Parameter errors")
	end
	# detail errors
	# 通过简要错误信息和详细错误信息来进行信息分割
	def render_detail_error detail
		render json: {status: ERROR_ARGUMENT, message: ERROR_ARGUMENT_MESSAGE, detail: detail}
	end
	
	def render_json object
		render_json_and_code(object, :ok)
	end
	
	def render_json_and_code object, code
		render json: {data:object}, status: code
	end
	private
		def destroy_session
			request.session_options[:skip] = true
		end
end
