class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.verify_email.subject
  #
  def verify_email()
    @user = params[:user]
    attachments.inline["logo.png"] = File.read("#{Rails.root}/app/assets/images/logo.png")
    attachments.inline["vk.png"] = File.read("#{Rails.root}/app/assets/images/vk.png")
    mail to: @user.email, subject: 'Код доступа'
  end
end
