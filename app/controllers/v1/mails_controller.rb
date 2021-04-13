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
end
