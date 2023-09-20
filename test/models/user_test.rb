require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without name, email, and password" do
    user = User.new
    assert_not user.valid?, "User is valid without name, email, and password"
  end

  test "should save user with valid data" do
    user = User.new(name: "Jonathan", email: "jonathan@exemplo.com", password: "password")
    assert user.save, "Could not save user with valid data"
  end
end
