class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    command = AuthenticateUser.call(user_params)

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def registration
    @user = User.new(user_params)

    if @user.save
      render json: :success, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end  
  
  private

  def user_params
    params.require(:users).permit(:name, :email, :password, :password_confirmation)
  end
end