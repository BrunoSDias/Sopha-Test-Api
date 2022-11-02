require 'rails_helper'

describe 'Store API' do
    context 'GET /api/v1/stores' do
        it 'and see all his stores' do
            @user = create(:user)
            @auth_headers = @user.create_new_auth_token
            @store1 = create(:store, user: @user)
            @store2 = create(:store, user: @user)

            get api_v1_stores_path(), headers: @auth_headers

            expect(response).to have_http_status(:success)
            expect(parsed_body[0][:store][:name]).to eq(@store1.name)
            expect(parsed_body[0][:store][:id]).to eq(@store1.id)
            expect(parsed_body[0][:store][:user_id]).to eq(@user.id)
            expect(parsed_body[1][:store][:name]).to eq(@store2.name)
            expect(parsed_body[1][:store][:id]).to eq(@store2.id)
            expect(parsed_body[1][:store][:user_id]).to eq(@user.id)
        end

        it 'and see just his stores' do
            @user1 = create(:user)
            @user2 = create(:user)
            @auth_headers = @user1.create_new_auth_token
            @store1 = create(:store, user: @user1)
            @store2 = create(:store, user: @user2)

            get api_v1_stores_path(), headers: @auth_headers

            expect(response).to have_http_status(:success)
            expect(parsed_body.count).to eq(1)
            expect(parsed_body[0][:store][:id]).to_not eq(@store2.id)
            expect(parsed_body[0][:store][:id]).to_not eq(@store2.name)
            expect(parsed_body[0][:store][:user_id]).to_not eq(@user2.id)
        end
    end

    context 'GET /api/v1/stores/:id' do
        it 'and see a specifical store' do
            @user = create(:user)
            @auth_headers = @user.create_new_auth_token
            @store = create(:store, user: @user)
            @store2 = create(:store, user: @user)

            get api_v1_store_path(@store), headers: @auth_headers
            
            expect(response).to have_http_status(:success)
            expect(parsed_body[:store][:name]).to eq(@store.name)
            expect(parsed_body[:store][:id]).to eq(@store.id)
            expect(parsed_body[:store][:user_id]).to eq(@user.id)
        end
    end
end
