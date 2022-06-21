# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/verify_email
  def verify_email
    UserMailer.with(user: User.first).verify_email
  end

end
