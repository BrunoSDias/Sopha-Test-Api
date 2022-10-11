require 'rails_helper'
require 'support/rails_request_helper'

RSpec.describe "Stores", type: :request do
  describe "POST #create" do
    context 'when the store is created' do
      let(:user) { create(:user) }
      let(:store_params) { attributes_for(:store, user_id: user.id) }

      before do
        user
        store_params

        post '/stores', params: { store: store_params }, headers: login_user(user)
      end

      it 'must return the store created and the 201 status code' do
        expect(response).to have_http_status(:created)
        expect(json_body).to include(:id, :name, :user_id)
      end
    end

    context 'when the store is not created' do
      let(:user) { create(:user) }
      let(:store_params) { attributes_for(:store, name: nil, user_id: nil) }

      before do
        user
        store_params

        post '/stores', params: { store: store_params }, headers: login_user(user)
      end

      it 'must return the message error and the 422 status code' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json_body).to include(:errors)
      end
    end
  end

  describe "GET #show" do
    context "when a store is found" do
      let(:user) { create(:user) }
      let(:store) { create(:store, user_id: user.id) }
  
      before do
        user
        store
  
        get "/stores/#{store.id}", headers: login_user(user)
      end
  
      it 'must return the store created and the 200 status code' do
        expect(response).to have_http_status(:ok)
        expect(json_body).to include(:id, :name)
      end
    end
  end

  describe "PUT #update" do
    context "when the store is updated" do
      let(:user) { create(:user) }
      let(:store) { create(:store, name: "abcd", user_id: user.id) }
      let(:store_params) { attributes_for(:store, name: "efgh", user_id: user.id) }

      before do
        user
        store
        store_params

        put "/stores/#{store.id}", params: { store: store_params }, headers: login_user(user)
      end

      it 'must return the 204 status code' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when the store is deleted" do
      let(:user) { create(:user) }
      let(:store) { create(:store, user_id: user.id) }
  
      before do
        user
        store

        delete "/stores/#{store.id}", headers: login_user(user)
      end
  
      it 'must return the store count and the 204 status code' do
        expect(response).to have_http_status(:no_content)
        expect(Store.count).to eq(0)
      end
    end
  end
end
