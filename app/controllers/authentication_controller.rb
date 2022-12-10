class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request
 
  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

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
    { 
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
   }
  end
end