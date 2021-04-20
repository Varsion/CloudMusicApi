class V1::SheetsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_data, only: [:update, :destroy]
    def index
	    @data = Sheet.all
    end

    def create
	    @data = current_user.sheets.build(sheet_params)
	    if @data.save
		    render_success(@data)
	    else
		    render_detail_error(@data.errors)
	    end
    end

    def show
	    @data = Sheet.find(params[:id])
    end

    def update
	    if @data.update(ad_params)
		    render_success(@data)
	    else
		    render_detail_error(@data.errors)
	    end
    end

	def destroy
		@data.destroy
	end
	
	private
		def sheet_params
			params.permit(:title, :banner, :description)
		end
		def set_data
			@data = current_user.sheets.find(params[:id])
		end
end
