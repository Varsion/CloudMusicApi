class ApplicationController < ActionController::API
	rescue_from Exception, with: :all_exception
	def all_exception exception
		if Rails.env.production?
			render json: {status: 10, message: "Some Errors"}, status: :accepted
		else
			raise exception
		end
	end
	#
	def render_success data
		render json: data, status: :ok
	end
	
	#
	def render_error code, message
		render json: {status: code, message: message}
	end
	
	#
	def render_default_error
		render_error(20, "Parameter errors")
	end
end
