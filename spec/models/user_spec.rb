require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = User.new(email: "abc@test.com", first_name: "test123", last_name: "abc", contact: 1234)
  end

  it "should be valid with valid attributes" do
    @user.email = nil
    expect|@user|.to_not be_valid
  end

end
