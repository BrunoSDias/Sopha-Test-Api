class Auth::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :authenticate_user!
end
