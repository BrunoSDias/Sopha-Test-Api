class DevisetokenAuth::RegistrationController < DeviseTokenAuth::SessionsController
  skip_before_action :authenticate_user!
end
