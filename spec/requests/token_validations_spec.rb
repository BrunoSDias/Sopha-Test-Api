require 'rails_helper'

RSpec.describe 'Token Validations', type: :request do
  describe 'signed in' do
    let(:user) { create(:user) }
    let(:valid_headers) { user.create_new_auth_token }

    it 'retorna status de sucesso' do
      get '/api/auth/validate_token', headers: valid_headers
      expect(response).to have_http_status(:success)
    end

    it 'retorna usuário' do
      get '/api/auth/validate_token', headers: valid_headers
      expect(JSON.parse(body)['data']['email']).to eq(user.email)
    end
  end

  describe 'signed out' do
    it 'retorna status de failure' do
      get '/api/auth/validate_token'
      expect(response.status).to eq(401)
    end
  end
end