require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end
  
  
end
