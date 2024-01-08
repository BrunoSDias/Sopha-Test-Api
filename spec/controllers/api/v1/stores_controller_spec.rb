# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::StoresController, type: :controller do
  include Devise::Test::ControllerHelpers

  let!(:user) { create(:user) }

  before do
    auth_headers = user.create_new_auth_token
    request.headers.merge!(auth_headers)
  end

  describe 'GET #index' do
    it 'returns a list of stores' do
      stores = create_list(:store, 3, user: user)

      get :index

      expect(JSON.parse(response.body)).to match_array(JSON.parse(stores.to_json))
    end
  end

  describe 'POST #create' do
    it 'with valid parameters creates a new store' do
      expect do
        post :create, params: { store: { name: 'bruno' } }
      end.to change(Store, :count).by(1)
    end

    it 'with invalid parameters returns unprocessable_entity status' do
      post :create, params: { store: { invalid_param: 'value' } }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET #show' do
    it 'returns the details of a specific store' do
      store = create(:store, user: user)
      get :show, params: { id: store.id }

      expect(JSON.parse(response.body)).to eq(JSON.parse(store.to_json))
    end

    it 'returns error resource not found' do
      get :show, params: { id: 10 }

      expect(JSON.parse(response.body)).to eq({ "error" => "Couldn't find Store with 'id'=10" })
    end
  end

  describe 'PUT #update' do
    let(:store) { create(:store, user: user) }
    let(:valid_params) { { id: store.id, store: { name: 'updated_name' } } }
    let(:invalid_params) { { id: store.id, store: { name: '' }  } }


    it 'with valid parameters updates an existing store' do
      put :update, params: valid_params

      expect(response).to have_http_status(:ok)
    end

    it 'with invalid parameters returns unprocessable_entity status' do
      put :update, params: invalid_params

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE #destroy' do
    it 'when store exists destroys an existing store' do
      store = create(:store, user: user)

      expect { delete :destroy, params: { id: store.id } }.to change(Store, :count).by(-1)
    end

    context 'when the store cannot be destroyed' do
      it 'returns an error message' do
        store = create(:store, user: user)

        allow_any_instance_of(Store).to receive(:destroy).and_return(false)

        delete :destroy, params: { id: store.id }

        expect(JSON.parse(response.body)).to eq('errors' => ['Failed to destroy store'])
      end
    end
  end
end