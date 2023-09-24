Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do 
    mount_devise_token_auth_for 'User', at: 'auth'
    
    scope module: :v1 do 
      resources :stores
    end
  end
end
