# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if current_user.id
      render json: {
        user: UserPresenter.present(current_user).merge(
          token: request.headers['warden-jwt_auth.token']
        )
      }
    else
      head :unauthorized
    end
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload =
        JWT.decode(
          request.headers['Authorization'].split(' ').last,
          Rails.application.secrets.devise_jwt_secret_key!
        ).first

      current_user = User.find(jwt_payload['sub'])
    end

    if current_user
      head :ok
    else
      head :unauthorized
    end
  end
end
