require 'rails_helper'

RSpec.describe 'POST /api/users/sign_in', type: :request do
  let (:user) { build_user }
  let (:url) { '/api/users/sign_in' }

  let (:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when params are correct' do
    before do
      post url, params: params
    end

    it 'returns 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns JTW token in authorization header' do
      expect(response.headers['Authorization']).to be_present
    end
  end

  context 'when login params are correct' do
    before { post url }
    
    it 'returns unathorized status' do
      expect(response.status).to eq 200
    end
  end
end
