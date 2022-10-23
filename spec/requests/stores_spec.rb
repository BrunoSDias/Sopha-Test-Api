require 'rails_helper'

RSpec.describe "Stores", type: :request do

  before(:all) do
    @user = create(:user)
    @user.save
    @headers = @user.create_new_auth_token
  end

  describe "GET /stores" do
    it 'should get index with code 200' do
      get '/stores', headers: @headers

      expect(response).to have_http_status(200)
    end

    it 'should get index with code 401' do
      get '/stores'

      expect(response).to have_http_status(401)
    end
  end

  describe "post /stores" do
    it 'should create a store and return 200 code' do
      post '/stores', params: {store:{name: Faker::Name.name}}, headers: @headers

      expect(response).to have_http_status(200)
    end

    it 'should get index with code 401' do
      post '/stores'

      expect(response).to have_http_status(401)
    end
  end

  describe "patch /stores" do
    it 'should change store name and return 200 code' do
      store = Store.create(name: "old_name", user_id: @user.id)

      patch '/stores', params: {store:{id: store.id, name: Faker::Name.name}}, headers: @headers

      expect(response).to have_http_status(200)
    end

    it 'should patch index with code 401' do
      patch '/stores'

      expect(response).to have_http_status(401)
    end
  end

  describe "patch /stores" do
    it 'should delete a store and return 200 code' do
      store = Store.create(name: "old_name", user_id: @user.id)

      delete '/stores', params: {store:{id: store.id}}, headers: @headers

      expect(response).to have_http_status(200)
    end

    it 'should patch index with code 401' do
      delete'/stores'

      expect(response).to have_http_status(401)
    end
  end
end
