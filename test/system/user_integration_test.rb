require 'application_system_test_case'

class UserIntegrationTest < ApplicationSystemTestCase
  test 'signing up a user' do
    visit root_url
    click_on 'Sign Up'
    fill_in 'Name', with: 'John'
    fill_in 'Email', with: 'john@example.com'
    fill_in 'Password', with: 'password'
    click_on 'Create User'
    assert_text 'User was successfully created.'
  end

  test 'signing in a user' do
    user = users(:one) 
    visit root_url
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_on 'Sign In'
    assert_text 'Signed in successfully.'
  end

end
