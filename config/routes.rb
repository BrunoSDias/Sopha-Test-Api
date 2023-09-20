Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :stores  
    post 'auth/login', to: 'users#authenticate'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
