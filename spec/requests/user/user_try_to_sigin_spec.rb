require 'rails_helper'

describe "User API" do
    context "POST /api/auth/sign_in afet GET /api/auth/validate_token" do
        it 'and logged in successfuly' do
            user = create(:user)

            post api_user_session_path(
                                       :email => user.email,
                                       :password => "123456789"
            )
            
            expect(response).to have_http_status(200)
        end

        it 'and done full loggin' do
          @user = create(:user)
          @auth_headers = @user.create_new_auth_token

          get api_auth_validate_token_path, params: {}, headers: @auth_headers

          expect(response).to have_http_status(:success)
        end

        it 'and password is wrong' do
            user = create(:user)
            post api_user_session_path,
                 params: {
                  email: user.email,
                  password: '12345aad'}
      
            expect(response).to have_http_status(401)
            expect(parsed_body[:errors][0]).to eq('Invalid login credentials. Please try again.')
        end

        it 'and email is wrong' do
          @user = create(:user)
          post api_user_session_path,
               params: {
                email: 'email@gmail.com.br',
                password: '123456789'}
      
            expect(response).to have_http_status(401)
            expect(parsed_body[:errors][0]).to eq('Invalid login credentials. Please try again.')
        end

        it 'and one credentials are wrong' do
          @user = create(:user)
          @auth_headers = @user.create_new_auth_token

          @auth_headers["access-token"] = "token-invalido"

          get api_auth_validate_token_path, params: {}, headers: @auth_headers
    
          expect(response).to have_http_status(401)
          expect(parsed_body[:errors][0]).to eq('Invalid login credentials')
      end
    end
end
