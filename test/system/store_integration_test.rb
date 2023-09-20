require 'application_system_test_case'

class StoreIntegrationTest < ApplicationSystemTestCase
  test 'creating a store' do
    user = users(:one) 
    login_as(user)

    visit stores_url
    click_on 'New Store'
    fill_in 'Name', with: 'My Store'
    click_on 'Create Store'
    assert_text 'Store was successfully created.'
  end

  test 'updating a store' do
    user = users(:one) 
    store = stores(:one) 
    login_as(user)

    visit store_url(store)
    click_on 'Edit'
    fill_in 'Name', with: 'Updated Store Name'
    click_on 'Update Store'
    assert_text 'Store was successfully updated.'
  end

end
