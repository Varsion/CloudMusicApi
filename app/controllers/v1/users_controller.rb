class V1::UsersController < ApplicationController
	before_action :authenticate_user!, only: [:bind, :unbind]
	before_action :set_user, only: %i[ show update destroy ]
	# TODO 后期完善用户表拆分
	
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
	
	def reset_password
		email = params[:email]
		code_string = params[:code]
		password = params[:password]
		user = User.find_by_email(email)
		
		if user.blank?
			render_error(ERROR_USER_EXIST, ERROR_USER_EXIST_MESSAGE)
		end
		
		# 参数检验
		if email.blank?
			render_argument_error
		end
		
		if code_string.blank?
			render_argument_error
		end
		
		# 验证码校验
		if user.code != DigestUtil.md5(code_string)
			render_error(ERROR_CODE, ERROR_CODE_MESSAGE)
		end
		
		if user.authenticated?("password", password)
			render_error(ERROR_USE_LAST_PASSWORD, ERROR_USE_LAST_PASSWORD_MESSAGE)
		end
		
		user.password = password
		if user.save
			user.update_column(:code, nil)
			render_success("Password reset complete!")
		else
			render_detail_error(user.errors)
		end
	end
	
	# 绑定第三方
	def bind
		platform = params[:platform]
		account = params[:account]
		
		if platform.blank? or account.blank?
			render_argument_error
		end
		
		# 平台取值是否正确
		if PLATFORM_QQ == platform
			@current_user.qq_id = account
		elsif PLATFORM_WECHAT == platform
			@current_user.wechat_id = account
		else
			render_argument_error
		end
		
		# 加密
		@current_user.encrypt_open_id
		
		# 保存，不验证规则
		if @current_user.save(validate: false)
			render_success("Bind Success!")
		else
			render_argument_error
		end
	end
	# 解绑第三方
	def unbind
		# url 中取值为String
		platform = params[:id]
		
		if platform.blank?
			render_argument_error
		end
		
		if PLATFORM_QQ.to_s == platform
			@current_user.qq_id = nil
			@current_user.qq_id_digest = nil
		elsif PLATFORM_WECHAT.to_s == platform
			@current_user.wechat_id = nil
			@current_user.wechat_id_digest = nil
		else
			render_argument_error
		end
		
		if @current_user.save(validate: false)
			render_argument_error
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
