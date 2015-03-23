class UserMailer < ApplicationMailer
  default from: 'notifications@fakepin.com'

  def welcome_email(user)
    @user = user
    @url  = 'localhost3000/loginpage'
    mail(to: @user.email, subject: 'Welcome to FakePin!')
  end
end
