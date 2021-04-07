class ApplicationController < ActionController::API
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
	def render_detail_error code,message,detail
		render json: {status: code, message: message, detail: detail}, status: :accepted
	end
end
