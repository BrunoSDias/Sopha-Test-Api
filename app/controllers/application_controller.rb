class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def current_user
    @current_user ||= find_current_user
  end

  def find_current_user
    if token_payload
      user_id = token_payload['user_id']
      User.find_by(id: user_id)
    end
  end

  def token_payload
    token = request.headers['Authorization']&.split&.last
    if token
      begin
        JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256').first
      rescue JWT::ExpiredSignature, JWT::DecodeError
        nil
      end
    end
  end
end
