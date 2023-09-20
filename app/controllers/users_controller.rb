class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:update, :destroy]

  # POST /auth/signup
  def signup
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # POST /auth/signin
  def signin
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = JWT.encode({ user_id: @user.id }, Rails.application.secret_key_base, 'HS256')
      render json: { token: token }
    else
      render json: { error: 'Credenciais inválidas' }, status: :unauthorized
    end
  end

  # GET /users/1
  def show
    render json: @user
  end

  # PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
