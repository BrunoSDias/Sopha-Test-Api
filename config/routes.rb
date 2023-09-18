Rails.application.routes.draw do
  # Rotas do DeviseTokenAuth
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    sessions: "auth/sessions"
  }

  # Rotas para o recurso :stores
  resources :stores, only: [:index, :show, :create, :update, :destroy]
end