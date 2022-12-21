Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :stores
    resources :users
  end
end
