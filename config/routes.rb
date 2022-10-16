Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :stores, only: [:create, :destroy, :update, :show]
      post 'authenticate', to: 'authentication#create'
      post 'users', to: 'user#register'
    end
  end
end
