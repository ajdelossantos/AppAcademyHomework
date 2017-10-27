class UserMailer < ApplicationMailer
  default from: 'admin@ninetyninecats.com'

  def welcome_email(user)
    @user = user
    @url = "http://www.ninetyninecats.com/login"
    mail(to: "name@gmail.com", subject: 'Your cats await')
  end
end
