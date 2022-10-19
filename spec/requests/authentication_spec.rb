require 'rails_helper'

describe 'Authentication', type: :request do
  describe 'POST /authenticate' do
    let(:user) { FactoryBot.create(:user, email: 'me@gmail.com', password: 'Tamakueno') }
    it 'authenticates the User ' do
      post '/api/v1/authenticate', params: { email: user.email, password: 'Tamakueno' }
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq({ 'token' => JSON.parse(response.body)['token'] })
    end

    it 'returns error when email is missing' do
      post '/api/v1/authenticate', params: {  password: 'Tamakueno' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({ 'error' => 'param is missing or the value is empty: email' })
    end

    it 'returns error when password is missing' do
      post '/api/v1/authenticate', params: { email: 'me@gmail.com' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)).to eq({ 'error' => 'param is missing or the value is empty: password' })
    end

    it 'returns error when password is incorrect' do
      post '/api/v1/authenticate', params: { email: user.email, password: 'blablabla' }

      expect(response).to have_http_status(:unauthorized)
    end
  end
end
