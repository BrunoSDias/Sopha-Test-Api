require 'swagger_helper'

RSpec.describe 'Users API', type: :request do

  path '/auth' do
    post 'Sign up a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, default: 'vitor@v.com' },
          password: { type: :string, default: '12345689' },
          password_confirmation: { type: :string, default: '12345689' },
          name: { type: :string, default: 'Vitor'},

        },
        required: ['email', 'password', 'password_confirmation', 'name']
      }

      response '201', 'User created' do
        let(:user) { { email: 'user@test.com', password: 'password', password_confirmation: 'password', name: 'Test User' } }
        run_test!
      end

      response '422', 'Invalid request' do
        let(:user) { { email: '', password: '', name: '' } }
        run_test!
      end
    end
  end

  path '/auth/sign_in' do
    post 'Sign in a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string , default: 'roberto@v.com'},
          password: { type: :string , default: '12345689'}
        },
        required: ['email', 'password']
      }

      response '200', 'User signed in' do
        let(:user) { { email: 'user@test.com', password: 'password' } }
        run_test!
      end

      response '401', 'Unauthorized' do
        let(:user) { { email: 'user@test.com', password: 'wrong_password' } }
        run_test!
      end
    end
  end
end
