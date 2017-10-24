# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserMailerPreview < ActionMailer::Preview
  def welcome
    UserMailer.welcome(User.first)
  end
end