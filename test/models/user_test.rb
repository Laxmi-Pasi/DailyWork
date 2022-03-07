require "test_helper"
require "user"

class UserTest < ActiveSupport::TestCase
  test "is equal" do
    assert_equal("laxmi" , "laxmi", "equals")
  end

  test "is not equal" do
    assert_not_equal("Laxmi" , "laxmi", "equals")
  end
  

  # def setup
  #   @user = User.new(email: "", first_name: "test123", last_name: "abc", contact: 1234)
  # end

  # test "should be valid" do
  #   assert_not @user.valid?
  # end

  # test "should not save without first name" do
  #   @user.first_name = ""
  #   assert_not @user.save
  # end

  # test "should be unique" do
  #   @user2 = User.new(email: "abc@test.com", first_name: "test1234")
  #   assert @user2.save
  # end
end
