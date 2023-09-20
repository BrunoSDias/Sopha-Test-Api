require "test_helper"

class StoreTest < ActiveSupport::TestCase
  test "should not save store without name" do
    store = Store.new
    assert_not store.save, "Saved store without a name"
  end

  test "should save store with valid data" do
    store = Store.new(name: "Loja do Jonathan", user: users(:one)) 
    assert store.save, "Could not save store with valid data"
  end
end
