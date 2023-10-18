require 'rails_helper'

RSpec.describe User, type: :model do
  context "when validating user before saving" do
    it "saves with valid attributes" do
      user = build(:user)

      expect { user.save! }.to change(User, :count).by(1)
    end

    context "for email attribute" do
      it "saves with a valid email" do
        valid_emails = [
          'valid@email.com', 'valid_email@domain.com', 'valid-email@domain.com', 'valid+email@domain.com',
          'valid.email@domain.com', 'valid_email123@domain.com', '123valid_email@domain.com', '_valid_email@domain.com',
          'valid_email@domain.com.pk'
        ]

        valid_emails.each do |valid_email|
          user = build(:user, email: valid_email)

          expect { user.save! }.to change(User, :count).by(1)
        end
      end

      it "does not save without an email" do
        invalid_user = build(:user, email: nil)

        expect { invalid_user.save! }.to raise_error("Validation failed: Email can't be blank")
      end

      it "does not save with an invalid email" do
        invalid_emails = [
          'invalid_email', 'invalid_email@', 'invalid_email@domain', 'invalid_email@domain.',
          'invalid_email.', 'invalid_email.com', 'invalid_email@.', 'invalid_email@.com',
          '@domain', '@domain.', '@domain.com', '@.com', '.com',
          'invalid_email@domain@anotherdomain.com'
        ]

        invalid_emails.each do |invalid_email|
          user = build(:user, email: invalid_email)

          expect { user.save! }.to raise_error("Validation failed: Email is invalid")
        end
      end
    end

    context "for password attribute" do
      it "does not save without a password" do
        invalid_user = build(:user, password: nil)

        expect { invalid_user.save! }.to raise_error("Validation failed: Password can't be blank")
      end

      it "saves with a minimum 8-character password" do
        user = build(:user, password: "12345678")

        expect { user.save! }.to change(User, :count).by(1)
      end

      it "does not save with less than 8-character password" do
        user = build(:user, password: "1234567")

        expect { user.save! }.to raise_error("Validation failed: Password is too short (minimum is 8 characters)")
      end

      it "saves with a maximum 128-character password" do
        user = build(:user, password: "a" * 128)

        expect { user.save! }.to change(User, :count).by(1)
      end

      it "does not save with more than 128-character password" do
        user = build(:user, password: "a" * 129)

        expect { user.save! }.to raise_error("Validation failed: Password is too long (maximum is 128 characters)")
      end
    end
  end
end
