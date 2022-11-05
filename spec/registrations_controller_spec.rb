require 'rails_helper'
require "json"

RSpec.describe 'POST /api/users', type: :request do

  let (:user) { build_user }
  let (:existing_user) { create_user }
  let (:signup_url) { '/api/users' }

  let (:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'When creating a new user' do
    before do
      post signup_url, params: params
    end

    it 'returns status 200' do
      expect(response.status).to eq(200)
    end
  end

  context 'When an email already exists' do
    before do
      post signup_url, params: {
        user: {
          email: existing_user.email,
          password: existing_user.password
        }
      }
    end

    it 'returns 400' do
      expect(response.status).to eq(400)
    end
  end

end