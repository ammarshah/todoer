require 'rails_helper'

RSpec.describe User, type: :model do
  context "when validating user before saving" do
    it "saves with valid attributes" do
      user = build(:user)

      expect { user.save! }.to change(User, :count).by(1)
    end

    context "for full_name attribute" do
      it "does not save without a full_name" do
        invalid_user = build(:user, full_name: nil)

        expect { invalid_user.save! }.to raise_error("Validation failed: Full name can't be blank")
      end

      it "does not save if full_name has more than 80 characters" do
        user_with_valid_full_name = build(:user, full_name: "Full Name with 80 Characters#{'s' * 52}")
        user_with_invalid_full_name = build(:user, full_name: "Full Name with 81 Characters#{'s' * 53}")

        expect { user_with_valid_full_name.save! }.not_to raise_error
        expect { user_with_invalid_full_name.save! }.to raise_error("Validation failed: Full name is too long (maximum is 80 characters)")
      end
    end

    context "for email attribute" do
      it "does not save without an email" do
        invalid_user = build(:user, email: nil)

        expect { invalid_user.save! }.to raise_error("Validation failed: Email can't be blank")
      end

      it "does not save if email already exists" do
        user = create(:user, email: "existing_email@example.com")
        user_with_existing_email = build(:user, email: "existing_email@example.com")
        another_user_with_existing_email = build(:user, email: "EXISTING_EMAIL@EXAMPLE.COM")

        expect { user_with_existing_email.save! }.to raise_error("Validation failed: Email has already been taken")
        expect { another_user_with_existing_email.save! }.to raise_error("Validation failed: Email has already been taken")
      end

      it "does not save if email has more than 150 characters" do
        user_with_valid_email = build(:user, email: "email_with_150_characters@example.com#{'m' * 113}")
        user_with_invalid_email = build(:user, email: "email_with_151_characters@example.com#{'m' * 114}")

        expect { user_with_valid_email.save! }.not_to raise_error
        expect { user_with_invalid_email.save! }.to raise_error("Validation failed: Email is too long (maximum is 150 characters)")
      end

      it "saves with a valid email format" do
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

      it "does not save with an invalid email format" do
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

      it "does not save if password_confirmation does not match" do
        user = build(:user, password: "password", password_confirmation: "PASSWORD")

        expect { user.save! }.to raise_error("Validation failed: Password confirmation doesn't match Password")
      end

      it "saves with a minimum 8-character password" do
        user = build(:user, password: "12345678")

        expect { user.save! }.to change(User, :count).by(1)
      end

      it "does not save with less than 8-character password" do
        user = build(:user, password: "1234567")

        expect { user.save! }.to raise_error("Validation failed: Password is too short (minimum is 8 characters)")
      end

      it "saves with a maximum 70-character password" do
        user = build(:user, password: "a" * 70)

        expect { user.save! }.to change(User, :count).by(1)
      end

      it "does not save with more than 70-character password" do
        user = build(:user, password: "a" * 71)

        expect { user.save! }.to raise_error("Validation failed: Password is too long (maximum is 70 characters)")
      end
    end
  end
end
