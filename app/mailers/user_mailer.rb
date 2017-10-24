class UserMailer < ApplicationMailer
  default :from => 'any_from_address@example.com'

  # send a signup (welcome) email to the user, pass in the user object that contains the user's email address
  def welcome(user)
    @user = user
    mail(:to => @user.email, :subject => 'EComms welcome email')
  end
end
