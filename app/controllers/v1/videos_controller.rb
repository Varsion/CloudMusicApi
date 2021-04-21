class V1::VideosController < ApplicationController
	before_action :authenticate_user!, only: [:create,:update,:destroy]
	before_action :set_data, only: [:update, :destroy]
	def index
		@data=Video.all
	end
	
	def create
		@data = current_user.videos.build(video_params)
		
		if @data.save
			render_success(@data)
		else
			render_detail_error(@data.errors)
		end
	end
	
	def show
		@data=Video.find(params[:id])
		# 点击量自增 会更新updated_at
		# @data.increment(:clicks_count).save
		# 不会更新updated_at
		# 如果需要做缓存 且不需要实时更新 建议使用第二种方法
		@data.update_column(:clicks_count, @data.clicks_count+1)
	end
	
	def update
		if @data.update(video_params)
			render_success(@data)
		else
			render_detail_error(@data.errors)
		end
	end
	
	def destroy
		@data.destroy
	end
	
	private
		def video_params
			params.permit(:title, :uri, :banner, :duration)
		end
		
		def set_data
			@data = current_user.videos.find(params[:id])
		end
end
