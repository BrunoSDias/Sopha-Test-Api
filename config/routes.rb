Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: { format: :json } do 
    scope module: :v1 do 
      resources :stores
    end
  end
end
