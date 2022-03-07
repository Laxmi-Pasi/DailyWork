require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.new(email: "abc@test.com", first_name: "test123", last_name: "abc", contact: 1234)
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_path, params: {user: {email: @user.email,first_name: @user.first_name}}
    end
    assert_redirected_to user_path(User.last)
  end

end
