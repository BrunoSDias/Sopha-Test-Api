require 'rails_helper'

describe 'Store API' do
    context 'PATCH /api/v1/stores' do
        it 'and update his store' do
            @user = create(:user)
            @auth_headers = @user.create_new_auth_token
            @store = create(:store, user: @user)
            new_name = { store: { name: 'Loja Nova'} }

            patch api_v1_store_path(@store),
                  params: new_name,
                  headers: @auth_headers


            expect(response).to have_http_status(:success)
            expect(parsed_body[:store][:id]).to eq(@store.id)
            expect(parsed_body[:store][:name]).to eq(new_name[:store][:name])
            expect(parsed_body[:store][:name]).to_not eq(@store.name)
        end
    end
end
