# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  let!(:user) { User.create!(name: 'Test', email: 'test@test.com', password: 'password') }
  let!(:token) do
    login = {
      user: {
        email: 'test@test.com',
        password: 'password'
      }
    }
    post '/login', params: login
    JSON.parse(body)['user']['token']
  end

  describe 'POST #create' do    
    it 'creates a new user', :aggregate_failures do
      params = {
        user: {
          name: 'Test',
          email: 'new@user.com',
          password: 'password'
        }
      }

      expect do
        post user_registration_path, params: params
      end.to change(User, :count).by(1)

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(body)['user']['email']).to eq(params[:user][:email])
    end
  end

  describe 'POST #login' do
    it 'login with the user credentials', :aggregate_failures do
      params = {
        user: {
          email: user.email,
          password: user.password
        }
      }
      
      post '/login', params: params

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(body)['user']['email']).to eq(params[:user][:email])
    end
  end

  describe 'DELETE #logout' do
    it 'logout user by token', :aggregate_failures do
      delete '/logout', headers: { Authorization: "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
    end
  end
end
