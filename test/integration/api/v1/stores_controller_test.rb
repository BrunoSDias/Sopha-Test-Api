# frozen_string_literal: true

require 'test_helper'

class Api::V1::StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    user = User.create!(name: 'Fulano',
                        email: 'de@tal',
                        password: '123',
                        password_confirmation: '123')

    @store = user.stores.create!(name: 'My Loja')

    user_params = { email: 'de@tal', password: '123' }
    command = AuthenticateUser.call(user_params)
    @api_token = command.result
  end

  # With Authorization
  test 'should get index' do
    get api_v1_stores_url, headers: { 'Authorization': @api_token }, as: :json
    assert_response :success
  end

  test 'should create store' do
    assert_difference('Store.count') do
      post api_v1_stores_url, params: { stores: { name: 'different store name', user_id: @store.user_id } },
                              headers: { 'Authorization': @api_token }, as: :json
    end

    assert_response 201
  end

  test 'should show store' do
    get api_v1_store_url(@store), headers: { 'Authorization': @api_token }, as: :json
    assert_response :success
  end

  test 'should update store' do
    patch api_v1_store_url(@store.id), params: { stores: { name: @store.name, user_id: @store.user_id } },
                                       headers: { 'Authorization': @api_token }, as: :json
    assert_response 200
  end

  test 'should destroy store' do
    assert_difference('Store.count', -1) do
      delete api_v1_store_url(@store), headers: { 'Authorization': @api_token }, as: :json
    end

    assert_response 204
  end

  # Without Authorization
  test 'shouldnt get index' do
    get api_v1_stores_url, as: :json
    assert_response :unauthorized
  end

  test 'shouldnt create store' do
    assert_no_difference('Store.count') do
      post api_v1_stores_url, params: { stores: { name: 'different store name', user_id: @store.user_id } }, as: :json
    end
    assert_response 401
  end

  test 'shouldnt show store' do
    get api_v1_store_url(@store), as: :json
    assert_response :unauthorized
  end

  test 'shouldnt update store' do
    patch api_v1_store_url(@store.id), params: { stores: { name: @store.name, user_id: @store.user_id } }, as: :json
    assert_response 401
  end

  test 'shouldnt destroy store' do
    assert_no_difference('Store.count') do
      delete api_v1_store_url(@store),  as: :json
    end

    assert_response 401
  end
end
