require 'rails_helper'

RSpec.describe User, type: :model do
  it "saves with valid attributes" do
    users_count = User.count
    user = build(:user)

    expect(user.save!).to be_truthy
    expect(User.count).to eq(users_count + 1)
  end
end
