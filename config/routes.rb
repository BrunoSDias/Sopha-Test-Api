Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Rotas do DeviseTokenAuth
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: "auth/sessions"
  }

  # Rotas para o recurso :stores
  resources :stores, only: [:index, :show, :create, :update, :destroy]
end
