class V1::TagsController < ApplicationController
	before_action :authenticate_user!, only: [:create,:update,:destroy]
	before_action :set_data, only: [:update, :destroy]
	
	def index
		parent_id=params[:parent_id]
		
		if  parent_id.blank?
			# 查询第一层标签
			@tags = Tag.first_level
		else
			# 查询指定层标签
			@tags = Tag.next_level(parent_id)
		end
	end
	
	def create
		@tag = current_user.sheets.build(tag_params)
		if @tag.save
			render_success(@tag)
		else
			render_detail_error(@tag.errors)
		end
	end
	
	def update
		if @data.update(tag_params)
			render_success(@tag)
		else
			render_detail_error(@tag.errors)
		end
	end
	
	def destroy
		@data.destroy
	end
	
	private
		def tag_params
			params.permit(:title, :parent_id)
		end
		
		def set_data
			@data = current_user.tags.find(params[:id])
		end
end