require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user =  User.create(name: "user1", password: "foobar", password_confirmation: "foobar")  
    @user2 = User.new(name: "", password: "barfoo", password_confirmation: "barfoo")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do    
    assert_not @user2.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 31
    assert_not @user.valid?
  end

  test "name should be unique" do    
    @user2.name = @user.name
    @user2.save
    assert_not @user2.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "associated tasks should be destroyed" do
    @user.save
    @user.tasks.create!(title: "test")
    assert_difference 'Task.count', -1 do
      @user.destroy
    end
  end
end
