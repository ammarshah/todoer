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

  it "does not save without an email" do
    users_count = User.count
    invalid_user = build(:user, email: nil)

    expect{ invalid_user.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email can't be blank")
    expect(User.count).to eq(users_count)
  end

  it "does not save with an invalid email" do
    users_count = User.count
    invalid_emails = [
      'invalid_email', 'invalid_email@', 'invalid_email@domain', 'invalid_email@domain.',
      'invalid_email.', 'invalid_email.com', 'invalid_email@.', 'invalid_email@.com',
      '@domain', '@domain.', '@domain.com', '@.com', '.com',
      'invalid_email@domain@anotherdomain.com'
    ]

    invalid_emails.each do |invalid_email|
      invalid_user = build(:user, email: invalid_email)
      expect{ invalid_user.save! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Email is invalid")
    end
    expect(User.count).to eq(users_count)
  end
end
