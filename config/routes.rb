Rails.application.routes.draw do
  resources :stores
  post 'authenticate', to: 'authentication#authenticate'
end
