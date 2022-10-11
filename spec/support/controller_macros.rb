module ControllerMacros
  def login_user(user)
    post '/auth/sign_in', params: { email: user.email, password: user.password }

    {
      'access-token': response.headers['access-token'],
      'token-type': response.headers['token-type'],
      'client': response.headers['client'],
      'expiry': response.headers['expiry'],
      'uid': response.headers['uid']
    }
  end
end