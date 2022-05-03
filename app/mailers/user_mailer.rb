class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.verify_email.subject
  #
  def verify_email(user)
    @user = user

    mail to: user.email
  end
end
