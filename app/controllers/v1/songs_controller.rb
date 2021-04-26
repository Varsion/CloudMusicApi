class V1::SongsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :set_data, only: [:show, :destroy, :update]
	def index
		@data = Song.all
	end
	
	def show
		@data=Video.find(params[:id])
		@data.update_column(:clicks_count, @data.clicks_count+1)
	end
	
	def create
		@data = current_user.songs.build(data_params)
		if @data.save
			render_success(@data)
		else
			render_detail_error(@data.errors)
		end
	end
	
	def destroy
		@data.destroy
	end
	
	def update
		if @data.update(data_params)
			render_success(@data)
		else
			render_detail_error(@data.errors)
		end
	end
	
	private
		def data_params
			params.permit(:title, :banner, :uri, :style, :lyric, :singer_id)
		end
		def set_data
			@data = Song.find(params[:id])
		end
end
