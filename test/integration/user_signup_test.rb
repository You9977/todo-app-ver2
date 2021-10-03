require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "example2",                                         
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'tasks/index'
    assert is_logged_in?
  end
end