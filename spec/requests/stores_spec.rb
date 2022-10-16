require 'rails_helper'

RSpec.describe 'Stores', type: :request do
  let!(:user) { FactoryBot.create(:user, name: 'Leopoldino', email: 'me@gmail.com', password: 'Tamakueno') }
  let!(:token) { AuthenticationTokenService.encode(user.id) }

  describe 'POST /stores' do
    it 'create a new store' do
      expect {
        post '/api/v1/stores', params: {
          store: { name: 'Bright', user_id: user.id }
        }, headers: { 'Authorization' => "Bearer #{token}" }
      }.to change { Store.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)).to eq(
        {
          'id' => JSON.parse(response.body)['id'],
          'name' => 'Bright',
          'owner' => 'Leopoldino'
        }
      )
    end

    context 'missing auth header' do
      it 'returns a 401' do
        post '/api/v1/stores', params: {}, headers: {}
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /stores/:id' do
    let!(:store) { FactoryBot.create(:store, name: 'ClothsB', user_id: user.id) }
    it 'deletes a store' do
      expect {
        delete "/api/v1/stores/#{store.id}", headers: { 'Authorization' => "Bearer #{token}" }
      }.to change { Store.count }.from(1).to(0)
      expect(response).to have_http_status(:no_content)
    end
  end
end
