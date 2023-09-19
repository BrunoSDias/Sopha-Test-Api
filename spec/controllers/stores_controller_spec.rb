require 'rails_helper'

RSpec.describe StoresController, type: :request do
  describe 'GET #index' do
    context 'when the user is not authenticated' do
      subject(:index_request) { get '/stores/' }

      before { index_request }

      it 'returns status 401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the user is authenticated but has no stores' do
      subject(:index_request) { get '/stores/', headers: get_headers(user) }
      let(:user) { create(:user) }

      before do
        user.stores.destroy_all
        index_request
      end

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns an empty array' do
        expect(json_body).to be_empty
      end
    end

    context 'when the user is authenticated' do
      subject(:index_request) { get '/stores/', headers: get_headers(user) }
      let(:user) { create(:user) }
      let!(:stores) { create_list(:store, 2, user: user) }
      let(:expected_store_count) { stores.count }

      before { index_request }

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a list of stores' do
        expect(user.stores.count).to eq(expected_store_count)
        expect(json_body.size).to eq(expected_store_count)
      end
    end
  end

  describe 'POST #create' do
    context 'when the user is not authenticated' do
      subject(:create_request) { post '/stores/', params: store_params }

      let(:store_params) { { store: attributes_for(:store) } }

      before { create_request }

      it 'returns status 401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the user is authenticated but provides invalid parameters' do
      subject(:create_request) do
        post '/stores/', params: { store: { name: '' } }, headers: get_headers(user)
      end

      let(:user) { create(:user) }

      before { create_request }

      it 'returns status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not create a new store' do
        expect(user.stores.count).to eq(0)
      end
    end

    context 'when the user is authenticated' do
      subject(:create_request) do
        post '/stores/', params: store_params, headers: get_headers(user)
      end

      let(:user) { create(:user) }
      let(:store_params) { { store: attributes_for(:store) } }

      before { create_request }

      it 'returns status 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns the created store' do
        expect(json_body[:name]).to eq(store_params[:store][:name])
      end

      it 'creates a new store' do
        expect(user.stores.count).to eq(1)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the user is not authenticated' do
      subject(:destroy_request) { delete "/stores/#{store.id}" }

      let(:user) { create(:user) }
      let!(:store) { create(:store, user: user) }

      before { destroy_request }

      it 'returns status 401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the user is authenticated' do
      subject(:destroy_request) do
        delete "/stores/#{store.id}", headers: get_headers(user)
      end

      let(:user) { create(:user) }
      let!(:store) { create(:store, user: user) }

      before { destroy_request }

      it 'returns status 204' do
        expect(response).to have_http_status(:no_content)
      end

      it 'deletes the store' do
        expect(user.stores.count).to eq(0)
      end
    end
    context 'when the user is authenticated but not the owner' do
      subject(:destroy_request) do
        delete "/stores/#{store.id}", headers: get_headers(user)
      end

      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      let!(:store) { create(:store, user: other_user) }

      before { destroy_request }

      it 'returns status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'does not delete the store' do
        expect(user.stores.count).to eq(0)
      end
    end
  end

  describe 'PUT #update' do
    context 'when the user is not authenticated' do
      subject(:update_request) { put "/stores/#{store.id}", params: store_params }

      let(:user) { create(:user) }
      let!(:store) { create(:store, user: user) }
      let(:store_params) { { store: attributes_for(:store) } }

      before { update_request }

      it 'returns status 401' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the user is authenticated' do
      subject(:update_request) do
        put "/stores/#{store.id}", params: store_params, headers: get_headers(user)
      end

      let(:user) { create(:user) }
      let!(:store) { create(:store, user: user) }
      let(:store_params) { { store: attributes_for(:store) } }

      before { update_request }

      it 'returns status 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'updates the store' do
        expect(json_body[:name]).to eq(store_params[:store][:name])
      end
    end

    context 'when the user is authenticated but not the owner' do
      subject(:delete_reque) do
        put "/stores/#{store.id}", params: store_params, headers: get_headers(user)
      end

      let(:user) { create(:user) }
      let(:other_user) { create(:user) }
      let!(:store) { create(:store, user: other_user) }
      let(:store_params) { { store: attributes_for(:store) } }

      before { delete_reque }

      it 'returns status 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
