class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:signup]

  def signup
    @user = User.new(user_params)
    if @user.save
      token = generate_token(@user)
      set_jwt_cookie(token)
      render json: { token: token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def signin
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = generate_token(@user)
      set_jwt_cookie(token)
      render json: { token: token }
    else
      render json: { error: 'Credenciais inválidas' }, status: :unauthorized
    end
  end

  def index
    @users = User.all
    render json: @users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def generate_token(user)
    JWT.encode({ user_id: user.id }, Rails.application.secret_key_base, 'HS256')
  end

  def set_jwt_cookie(token)
    cookies.signed[:jwt] = { value: token, httponly: true, expires: 1.day.from_now }
  end
end
