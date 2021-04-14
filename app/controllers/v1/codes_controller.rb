class V1::CodesController < ApplicationController
  def request_email_code
	  user = User.find_by_email(params[:email])
	  unless user
		  render_error(ERROR_USER_NOT_EXIST, ERROR_USER_NOT_EXIST_MESSAGE)
		  return
	  end
	  if user.code_sent_at.present? && Time.now-user.code_sent_at < 1.minute
		  render_api_too_fast
	  end
	  code_string=CodeUtil.int4
	  if user.update_columns({ code: DigestUtil.md5(code_string), code_sent_at: Time.now })
		  AllMailer.request_email_code(user,code_string).deliver_later
	  else
		  render_detail_error(user.errors)
	  end
  end
end
