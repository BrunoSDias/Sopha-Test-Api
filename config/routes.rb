# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do
      resources :stores
      post 'sign_in', to: 'authentication#authenticate'
      post 'sign_up', to: 'authentication#registration'
    end
  end
end
