class V1::LikesController < ApplicationController
	before_action :authenticate_user!
	before_action :type
	# TODO 尝试使用元编程解决多种类型的点赞
	def create
		@like = current_user.likes.build(data_params)
		if @like.save
			render_success(@like)
		else
			render_argument_error
		end
	end
	
	def destroy
		@like = current_user.likes.find(params[:id])
		@like.destroy
	end
	
	private
		def data_params
			params.permit(:comment_id)
		end
	
		def type
			@type = params[:type]
		end
end
