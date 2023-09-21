require 'rails_helper'

# rubocop: disable Metrics/BlockLength
RSpec.describe '/stores', type: :request do
  let(:user) { create :user }
  let(:store) { create :store, user: user }
  let(:store_two) { create :store, user: create(:user) }

  let(:valid_attributes) { attributes_for :store, user: user }
  let(:invalid_attributes) { attributes_for :invalid_store, user: user }

  let(:valid_headers) do
    user.create_new_auth_token
  end
  let(:invalid_headers) do
    { 'Accept' => 'application' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get api_stores_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'renders only stores from logged user' do
      store
      store_two

      get api_stores_url, headers: valid_headers, as: :json
      expect(json_response.size).to eq 1
      expect(json_response[0][:id]).to eq store.id
    end

    it_behaves_like 'user not logged in' do
      let(:url) { get api_stores_url, headers: invalid_headers, as: :json }
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_store_url(store), headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        get api_store_url(store_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        get api_store_url(store), headers: invalid_headers, as: :json
      end
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Store' do
        expect do
          post api_stores_url,
               params: { store: valid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Store, :count).by(1)
      end

      it 'renders a JSON response with the new store' do
        post api_stores_url,
             params: { store: valid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Store' do
        expect do
          post api_stores_url,
               params: { store: invalid_attributes },
               headers: valid_headers,
               as: :json
        end.to change(Store, :count).by(0)
      end

      it 'renders a JSON response with errors for the new store' do
        post api_stores_url,
             params: { store: invalid_attributes },
             headers: valid_headers,
             as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        post api_stores_url,
             params: { store: valid_attributes },
             headers: invalid_headers,
             as: :json
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for :store }

      it 'updates the requested store' do
        patch api_store_url(store),
              params: { store: new_attributes },
              headers: valid_headers,
              as: :json
        store.reload
        expect(store.name).to eq(new_attributes[:name])
      end

      it 'renders a JSON response with the store' do
        patch api_store_url(store),
              params: { store: new_attributes },
              headers: valid_headers,
              as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the store' do
        patch api_store_url(store),
              params: { store: invalid_attributes },
              headers: valid_headers,
              as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        patch api_store_url(store_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        patch api_store_url(store),
              params: { store: valid_attributes },
              headers: invalid_headers,
              as: :json
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested store' do
      store
      expect do
        delete api_store_url(store), headers: valid_headers, as: :json
      end.to change(Store, :count).by(-1)
    end

    it_behaves_like "trying to access another user's resource" do
      let(:url) do
        delete api_store_url(store_two), headers: valid_headers, as: :json
      end
    end

    it_behaves_like 'user not logged in' do
      let(:url) do
        delete api_store_url(store), headers: invalid_headers, as: :json
      end
    end
  end
end
