class V1::SessionsController < ApplicationController
	before_action :authenticate_user!, only: :destroy
  def create
	  email = params[:email]
	  phone = params[:phone]
	  password = params[:password]
	  qq_id = params[:qq_id]
	  wechat_id = params[:wechat_id]
	  # 同时支持手机号和邮箱登陆
	  if email.present? && password.present?
		  user = User.find_by_email(email)
		  attribute = "password"
		  digest = password
	  elsif phone.present? && password.present?
		  user = User.find_by_phone(phone)
		  attribute = "password"
		  digest = password
	  elsif qq_id.present?
		  user = User.find_by_qq_id(DigestUtil.encrypt_des(qq_id))
		  attribute = "qq_id"
		  digest = qq_id
	  elsif wechat_id.present?
		  user = User.find_by_wechat_id(DigestUtil.encrypt_des(wechat_id))
		  attribute = "wechat_id"
		  digest = wechat_id
	  end
	  
	  if user
		  if user.authenticated?(attribute, digest)
			  session = DigestUtil.encrypt(DigestUtil.random_base64_32)
			  session_digest = DigestUtil.encrypt(session)
			  
			  if user.update_attribute(:session_digest, session_digest)
				  # 登陆成功
				  # 返回 userid 和 未加密的 session
				  render_json({user:user.id, session: session})
			  else
				  render_error(ERROR_SAVE_SESSION, ERROR_SAVE_SESSION_MESSAGE)
			  end
		  else
			  render_error(ERROR_USERNAME_OR_PASSWORD, ERROR_USERNAME_OR_PASSWORD_MESSAGE)
		  end
	  else
		  # 未注册
		  render_error(ERROR_USER_NOT_EXIST,ERROR_USER_NOT_EXIST_MESSAGE)
	  end
  end
  
  def destroy
	  current_user.update_attribute(:session_digest, "")
  end
end
