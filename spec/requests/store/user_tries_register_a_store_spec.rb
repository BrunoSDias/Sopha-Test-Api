require 'rails_helper'

describe 'Store API' do
  context 'POST /api/v1/stores' do
    it 'and store is create' do
      @user = create(:user)
      @auth_headers = @user.create_new_auth_token
      @store = { store: { name: 'Loja teste' } }

      post api_v1_stores_path(@store), headers: @auth_headers
      
      expect(response).to have_http_status(:created)
      expect(parsed_body[:store][:name]).to eq(@store[:store][:name])
    end

    it 'and store is blank' do
      @user = create(:user)
      @auth_headers = @user.create_new_auth_token
      @store = { store: { name: '' } }

      post api_v1_stores_path(@store), headers: @auth_headers
      
      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_body[:name][0]).to eq("can't be blank")
    end

    it 'and store is too short' do
      @user = create(:user)
      @auth_headers = @user.create_new_auth_token
      @store = { store: { name: 'a' } }

      post api_v1_stores_path(@store), headers: @auth_headers
      
      expect(response).to have_http_status(:unprocessable_entity)
      expect(parsed_body[:name][0]).to eq("is too short (minimum is 2 characters)")
    end

    it 'and user is not authenticate' do
      @user = create(:user)
      @store = { store: { name: '1233131' } }

      post api_v1_stores_path(@store)
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body[:errors][0]).to eq("You need to sign in or sign up before continuing.")
    end

    it 'and user has a header wrong' do
      @user = create(:user)
      @auth_headers = @user.create_new_auth_token
      @auth_headers['access-token'] = 'token-invalido'
      @store = { store: { name: '1233131' } }

      post api_v1_stores_path(@store), headers: @auth_headers
      expect(response).to have_http_status(:unauthorized)
      expect(parsed_body[:errors][0]).to eq("You need to sign in or sign up before continuing.")
    end
  end
end
