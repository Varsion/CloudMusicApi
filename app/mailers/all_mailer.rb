class AllMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.all_mailer.confirm_verification.subject
  #
  def confirm_verification user, digest
	  
	  @name = user.nickname
	  @email = user.email
	  @confirm_url = "#{ENV["HOST"]}/v1/mails/#{digest}/confirm_verification/"
	  
    mail to: @email, subject: "CloudMusic 邮箱验证"
  end
end
