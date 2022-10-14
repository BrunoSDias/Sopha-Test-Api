class RegistrationsController < DeviseTokenAuth::RegistrationsController

  def create
    @resource = User.new(sign_up_params)
    @resource.save

    render json: @resource
  end

  private

  def sign_up_params
    params.permit(:name, :email, :password)
  end
end