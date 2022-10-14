Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations',
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # devise_for :users, path: 'auth', path_names: { 
  #   sign_in: 'login',
  #   sign_out: 'logout',
  #   password: 'secret',
  #   confirmation: 'verification',
  #   unlock: 'unblock',
  #   registration: 'register',
  #   sign_up: 'cmon_let_me_in'
  # }

  resources :stores, only: %i[create show update destroy]
end
