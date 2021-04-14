# Preview all emails at http://localhost:3000/rails/mailers/all_mailer
class AllMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/all_mailer/confirm_verification
  def confirm_verification
	  user = User.first
	  AllMailer.confirm_verification(user,"111")
  end
  def request_email_code
	  user = User.first
	  AllMailer.request_email_code(user,"111")
  end

end
