module Concerns
	module RenderJson
		def self.included base
			base.class_eval do
				helper_method :render_success, :render_fail, :render_error, :render_default_error, :render_detail_error,
				              :render_json, :render_json_and_code, :render_api_too_fast, :render_argument_error, :render_send_sms_error
			end
		end
		
		# success
		def render_success data
			render json: {status: :ok, message: data}, status: :ok
		end
		
		# fails
		def render_fail data
			render json: {status: :accepted, message: data}, status: :accepted
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
		
		def render_api_too_fast
			render_error(ERROR_TOO_FAST, ERROR_TOO_FAST_MESSAGE)
		end
		
		def render_argument_error
			render_error(ERROR_ARGUMENT, ERROR_ARGUMENT_MESSAGE)
		end
		
		def render_send_sms_error
			render_error(ERROR_SEND_SMS, ERROR_SEND_SMS_MESSAGE)
		end
	end
end