class V1::CommentsController < ApplicationController
	before_action :authenticate_user!, only: [:create,:update,:destroy]
	before_action :set_data, only: [:show, :update, :destroy]
	
	def index
		@data=Comment.all
	end
	
	def show
	
	end
	
	def create
		@data = current_user.comments.build(data_params)
		
		if @data.save
			render_success(@data)
		else
			render_detail_error(@data.errors)
		end
	end
	
	def update
		if @data.update(data_params)
			render_success(@data)
		else
			render_detail_error(@data.errors)
		end
	end
	
	def destroy
		@data.destroy
	end
	
	private
		def data_params
			params.permit(:style, :content, :parent_id, :video_id, :sheet_id, :song_id)
		end
		
		def set_data
			@data = current_user.comments.find(params[:id])
		end
end
