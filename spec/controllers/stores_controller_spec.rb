# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StoresController, type: :request do
  describe 'POST #stores' do
    let!(:user) { User.create!(name: 'Test', email: 'test@test.com', password: 'password') }
    let!(:token) do
      login = {
        user: {
          email: 'test@test.com',
          password: 'password'
        }
      }
      post '/login', params: login
      JSON.parse(body)['user']['token']
    end

    context 'with authenticated user' do
      context '#index' do
        it 'list user stores' do
          # to-do
        end
      end

      context '#show' do
        it 'show a given store' do
          # to-do
        end
      end

      context '#create' do
        it 'creates a new store', :aggregate_failures do
          params = { name: 'Test Store'}

          post '/stores', params: params, headers: { Authorization: "Bearer #{token}" }

          expect(response).to have_http_status(:created)
          expect(JSON.parse(response.body)['store']['name']).to eq(params[:name])
        end
      end

      context '#update' do
        it 'update a given store', :aggregate_failures do
          user.stores.create!(name: 'Test Store')

          expect do
            put "/stores/#{user.stores.last.id}", params: { name: 'New Test Store Name'}, headers: { Authorization: "Bearer #{token}" }
          end.to change { user.stores.last.name }.from('Test Store').to('New Test Store Name')

          expect(response).to have_http_status(:ok)
        end
      end

      context '#delete' do
        it 'delete a given store', :aggregate_failures do
          user.stores.create!(name: 'Foo')

          expect do
            delete "/stores/#{user.stores.last.id}", headers: { Authorization: "Bearer #{token}" }
          end.to change { user.stores.count }.by(-1)

          expect(response).to have_http_status(:no_content)
        end
      end
    end

    context 'with unauthorized user' do
      it 'returns 401' do
        get '/stores'

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
