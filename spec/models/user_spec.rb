require 'rails_helper'

RSpec.describe User, type: :model do
  it "saves with valid attributes" do
    users_count = User.count
    user = build(:user)

    expect(user.save!).to be_truthy
    expect(User.count).to eq(users_count + 1)
  end

  it "does not save without a password" do
    users_count = User.count
    invalid_user = build(:user, password: nil)

    expect{ invalid_user.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Password can't be blank")
    expect(User.count).to eq(users_count)
  end
end
