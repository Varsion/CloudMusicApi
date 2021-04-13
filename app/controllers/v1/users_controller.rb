class V1::UsersController < ApplicationController
	before_action :set_user, only: %i[ show update destroy ]
	
	
	# GET /users/1
	# GET /users/1.json
	def show
		# 会自动渲染对应的 jbuilder文件
	end
	
	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)
		if @user.email.blank? or @user.password.blank? or @user.phone.blank?
			render_error(ERROR_EMPTY_EMAIL_OR_PASSWORD,ERROR_EMPTY_EMAIL_OR_PASSWORD_MESSAGE)
			return
		end
		
		if User.exists?(email: @user.email) or User.exists?(phone: @user.phone)
			render_error(ERROR_USER_EXIST,ERROR_USER_EXIST_MESSAGE)
			return
		end
		
		@user.encrypt_open_id
		
		if @user.save
			@user.request_email_verification
			render_success(@user)
		else
			render_detail_error(@user.errors)
		end
	end
	
	# PATCH/PUT /users/1
	# PATCH/PUT /users/1.json
	def update
		if @user.update(user_params)
			render :show, status: :ok, location: @user
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end
	
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
		@user = User.find(params[:id])
	end
	
	# Only allow a list of trusted parameters through.
	def user_params
		params.permit(:nickname, :avatar, :description, :password, :gender, :birthday, :email, :phone, :qq_id, :wechat_id)
	end
end
