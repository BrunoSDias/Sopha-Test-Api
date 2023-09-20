require "test_helper"
class StoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store = stores(:one)
    @user = users(:one)
    @token = JWT.encode({ user_id: @user.id }, Rails.application.secret_key_base, 'HS256')
  end
  test "should create store" do
    assert_difference("Store.count") do
      post stores_url, params: { store: { name: "Nova Loja", user_id: @user.id } }, headers: { "Authorization" => "Bearer #{@token}" }
    end
    assert_response :created
    assert_redirected_to store_url(Store.last)
  end
  test "should show store" do
    get store_url(@store)
    assert_response :success
  end
  test "should update store" do
    patch store_url(@store), params: { store: { name: "Updated Name" } }, headers: { "Authorization" => "Bearer #{@token}" }
    assert_response :ok
    assert_redirected_to store_url(@store)
  end
  test "should destroy store" do
    assert_difference("Store.count", -1) do
      delete store_url(@store), headers: { "Authorization" => "Bearer #{@token}" }
    end
    assert_response :no_content
    assert_redirected_to stores_url
  end
end
