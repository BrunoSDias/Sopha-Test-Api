class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  rescue_from ActiveRecord::RecordNotFound, with: :show_not_found_errors

  protected

  def show_not_found_errors(exception)
    render json: { error: exception.message.to_s }, status: :not_found
  end
end
