class V1::MailsController < ApplicationController
	def request_verification
		# 判断邮箱是否已经验证
		if current_user.email_verification?
			render_error(ERROR_EMAIL_ALREADY_CONFIRM,ERROR_EMAIL_ALREADY_CONFIRM_MESSAGE)
		else
			if current_user.request_email_verification
			else
				render_error(ERROR_EMAIL_SEND,ERROR_EMAIL_SEND_MESSAGE)
			end
		end
	end
	
	# 验证邮箱逻辑
	def confirm_verification
		id = params[:id]
		user = User.find_by_confirmation_digest(DigestUtil.md5(id))
		
		if !user
			render_fail("获取验证信息失败，请重新发送验证邮件")
		elsif Time.now > user.confirmation_sent_at + 1.day
			render_fail("邮箱验证码过期，请重新验证")
		elsif user.email_verification?
			render_fail("该邮箱地址已验证")
		else
			user.update_columns({ confirmation_digest: nil, confirmed_at: Time.now })
			render_success("邮箱验证成功")
		end
	end
end
