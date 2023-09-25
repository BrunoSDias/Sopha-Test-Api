# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      user: UserSerializer.new(resource).serialize.merge(token: request.env['warden-jwt_auth.token'])
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {message: 'Logout successfully.' } , status: :ok
    else
      render json: {message: 'You need to sign in or sign up before continuing.' } , status: :unauthorized
    end
  end
end