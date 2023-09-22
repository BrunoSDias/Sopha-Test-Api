require 'rails_helper'

RSpec.describe 'Store', type: :request do
  let(:user) { create :user }
  let(:store) { create :store, user: user }
  let(:store_two) { create :store, user: create(:user) }
  let(:store_params) { attributes_for :store }

  let(:valid_attributes) { attributes_for :store, user: user }
  let(:invalid_attributes) { attributes_for :store_without_name, user: user }

  let(:valid_headers) do
    user.create_new_auth_token.merge('Accept' => 'application/vnd.store.v1')
  end

  let(:invalid_headers) do
    { 'Accept' => 'application/vnd.blog.v1' }
  end

  describe 'GET /index' do
    it 'retorna sucesso na requisição' do
      get api_stores_path, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'retorna stores do usuário' do
      store
      store_two

      get api_stores_path, headers: valid_headers, as: :json
      json_reponse = JSON.parse(response.body)
      expect(json_reponse.count).to eq(user.stores.count)
    end
  end

  describe 'GET /show' do
    it 'retorna sucesso na requisição' do
      get api_store_path(store), headers: valid_headers, as: :json
      expect(response).to be_successful
    end

    it 'retorna store do usuário' do
      get api_store_path(store), headers: valid_headers, as: :json
      json_reponse = JSON.parse(response.body)
      expect(json_reponse['id']).to eq(store.id)
    end

    it 'retorna erro de não autorização' do
      get api_store_path(store_two), headers: valid_headers, as: :jsons
      expect(response.message).to eq('Not Found')
    end
  end

  describe 'POST /create' do
    context 'com atributos válidos' do
      it 'cria uma nova store' do
        expect do
          post api_stores_path, params: { store: valid_attributes },
                                headers: valid_headers, as: :json
        end.to change(Store, :count).by(1)
      end

      it 'retorna status de sucesso' do
        post api_stores_path, params: { store: valid_attributes },
                              headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context 'com atributos inválidos' do
      it 'não cria uma nova store' do
        expect do
          post api_stores_path, params: { store: invalid_attributes },
                                headers: valid_headers, as: :json
        end.to change(Store, :count).by(0)
      end

      it 'retorna status de erro' do
        post api_stores_path, params: { store: invalid_attributes },
                              headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT /update' do
    context 'com atributos válidos' do
      let(:new_attributes) { { name: 'New Name' } }

      it 'atualiza a store' do
        put api_store_path(store), params: { store: new_attributes },
                                   headers: valid_headers, as: :json
        store.reload
        expect(store.name).to eq('New Name')
      end

      it 'retorna status de sucesso' do
        put api_store_path(store), params: { store: new_attributes },
                                   headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'com atributos inválidos' do
      it 'não atualiza a store' do
        put api_store_path(store), params: { store: invalid_attributes },
                                   headers: valid_headers, as: :json
        store.reload
        expect(store.name).not_to eq('')
      end

      it 'retorna status de erro' do
        put api_store_path(store), params: { store: invalid_attributes },
                                   headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'deleta a store' do
      store
      expect do
        delete api_store_path(store), headers: valid_headers, as: :json
      end.to change(Store, :count).by(-1)
    end

    it 'retorna status de sucesso' do
      delete api_store_path(store), headers: valid_headers, as: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end