class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create

  # POST /signup
  # Return authenticated token upon signup
  def create
    user = User.create!(user_params)
    UserMailer.welcome(@user).deliver_later
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  # def send_welcome_email
  #   SendEmailJob.set(wait: 20.seconds).perform_later(@user)
  # end
end