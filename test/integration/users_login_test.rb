require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:example1)
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { name:    @user.name,
                                          password: 'password' } }
    assert_redirected_to tasks_url(@user)
    follow_redirect!
    assert_template 'tasks/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path    
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get login_path
    assert flash.empty?
  end

  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { name:    @user.name,
                                          password: "invalid" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end