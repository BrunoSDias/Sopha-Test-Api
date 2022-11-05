Rails.application.routes.draw do
  scope '/api' do
      
    devise_for :users,
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

    resources :stores
  end
end
