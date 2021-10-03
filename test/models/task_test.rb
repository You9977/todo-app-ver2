require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = users(:example1)    
    @task = @user.tasks.build(title: "title")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
end
