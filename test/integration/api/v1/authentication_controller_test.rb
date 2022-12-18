# frozen_string_literal: true

require 'test_helper'

class Api::V1::AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create!(name: 'Fulano',
                        email: 'de@tal',
                        password: '123',
                        password_confirmation: '123')
  end

  test 'should register user' do
    post '/api/v1/sign_up', params: { users:
                                  { name: 'fulano',
                                    email: 'another@fulano',
                                    password: '123',
                                    password_confirmation: '123' } }, as: :json
    assert_response :success
  end

  test 'shouldnt register user' do
    post '/api/v1/sign_up', params: { users:
                                  { name: 'fulano',
                                    email: nil,
                                    password: nil,
                                    password_confirmation: nil } }, as: :json
    assert_response :unprocessable_entity
  end

  test 'should authenticate user' do
    post '/api/v1/sign_in', params: {
      users: {
        email: 'de@tal',
        password: '123'
      }
    }, as: :json

    assert_response :success
  end

  test 'shouldnt authenticate user' do
    post '/api/v1/sign_in', params: {
      users: {
        email: 'de@tal',
        password: '1234'
      }
    }, as: :json

    assert_response :unauthorized
  end
end
