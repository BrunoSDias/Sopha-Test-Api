require 'rails_helper'

describe 'Store API' do
    context 'DELETE /api/v1/stores' do
        it 'and delete his store' do
            @user = create(:user)
            @auth_headers = @user.create_new_auth_token
            @store = create(:store, user: @user)

            delete api_v1_store_path(@store), headers: @auth_headers

            expect(response).to have_http_status(:no_content)
            expect(@user.stores.count).to eq(0)
        end
    end
end
