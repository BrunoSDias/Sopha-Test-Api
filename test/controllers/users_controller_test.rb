require "test_helper"
class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "should sign up" do
    assert_difference("User.count", 1) do
      post users_url, params: { user: { name: "Novo User", email: "novo_user@exemplo.com", password: "password" } }
    end
    assert_response :created
  end
  test "should sign in" do
    post signin_users_url, params: { email: @user.email, password: "password" }
    assert_response :success
    assert_not_nil JSON.parse(response.body)["token"]
  end
  private
  def token
    payload = { user_id: @user.id }
    secret_key = Rails.application.secret_key_base
    token = JWT.encode(payload, secret_key, 'HS256')
    token
  end
end
