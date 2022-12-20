require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store = stores(:one)
  end

  test "should get index" do
    get stores_url, as: :json
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post stores_url, params: { store: { name: @store.name, user_id: @store.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show store" do
    get store_url(@store), as: :json
    assert_response :success
  end

  test "should update store" do
    patch store_url(@store), params: { store: { name: @store.name, user_id: @store.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete store_url(@store), as: :json
    end

    assert_response 204
  end
end
