module Concerns
	module Paginate
		def self.included base
			base.class_eval do
				helper_method :paginator
			end
		end
		
		def paginator data
			data.page(params[:page] || 1).per(params[:size] || 10)
		end
	end
end