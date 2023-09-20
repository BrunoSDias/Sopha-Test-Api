Rails.application.routes.draw do
  resources :users, only: [:create, :index] do
    resources :stores, only: [:index, :show, :create, :update, :destroy]
  end

  post 'users/signup', to: 'users#signup'
  post 'users/signin', to: 'users#signin'
end
