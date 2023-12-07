require 'rails_helper'

RSpec.describe Approachment, type: :model do
  include ActiveJob::TestHelper

  context "when validating approachment before saving" do
    it "saves with valid attributes" do
      approachment = build(:approachment)

      expect { approachment.save! }.to change(Approachment, :count).by(1)
    end

    context "for name attribute" do
      it "does not save without a name" do
        invalid_approachment = build(:approachment, name: "")

        expect { invalid_approachment.save! }.to raise_error("Validation failed: Name can't be blank")
      end

      it "does not save if name has more than 80 characters" do
        approachment_with_valid_name = build(:approachment, name: "Name with 80 characters#{'s' * 57}")
        approachment_with_invalid_name = build(:approachment, name: "Name with 81 characters#{'s' * 58}")

        expect { approachment_with_valid_name.save! }.not_to raise_error
        expect { approachment_with_invalid_name.save! }.to raise_error("Validation failed: Name is too long (maximum is 80 characters)")
      end

      it "squishes the name while saving" do
        approachment = create(:approachment, name: "    John    Doe    ")

        expect(approachment.name).to eq("John Doe")
      end
    end

    context "for email attribute" do
      it "does not save without an email" do
        invalid_approachment = build(:approachment, email: "")

        expect { invalid_approachment.save! }.to raise_error("Validation failed: Email can't be blank")
      end

      it "does not save if email has more than 150 characters" do
        approachment_with_valid_email = build(:approachment, email: "email_with_150_characters@example.com#{'m' * 113}")
        approachment_with_invalid_email = build(:approachment, email: "email_with_151_characters@example.com#{'m' * 114}")

        expect { approachment_with_valid_email.save! }.not_to raise_error
        expect { approachment_with_invalid_email.save! }.to raise_error("Validation failed: Email is too long (maximum is 150 characters)")
      end

      it "saves with a valid email format" do
        valid_emails = [
          'valid@email.com', 'valid_email@domain.com', 'valid-email@domain.com', 'valid+email@domain.com',
          'valid.email@domain.com', 'valid_email123@domain.com', '123valid_email@domain.com', '_valid_email@domain.com',
          'valid_email@domain.com.pk'
        ]

        valid_emails.each do |valid_email|
          approachment = build(:approachment, email: valid_email)

          expect { approachment.save! }.to change(Approachment, :count).by(1)
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
          approachment = build(:approachment, email: invalid_email)

          expect { approachment.save! }.to raise_error("Validation failed: Email is invalid")
        end
      end

      it "squishes the email while saving" do
        approachment = create(:approachment, email: "    user@example.com    ")

        expect(approachment.email).to eq("user@example.com")
      end
    end

    context "for subject attribute" do
      it "does not save without a subject" do
        invalid_approachment = build(:approachment, subject: "")

        expect { invalid_approachment.save! }.to raise_error("Validation failed: Subject can't be blank")
      end

      it "does not save if subject has more than 150 characters" do
        approachment_with_valid_subject = build(:approachment, subject: "subject_with_150_characters@example.com#{'m' * 111}")
        approachment_with_invalid_subject = build(:approachment, subject: "subject_with_151_characters@example.com#{'m' * 112}")

        expect { approachment_with_valid_subject.save! }.not_to raise_error
        expect { approachment_with_invalid_subject.save! }.to raise_error("Validation failed: Subject is too long (maximum is 150 characters)")
      end

      it "squishes the subject while saving" do
        approachment = create(:approachment, subject: "    This   is a    subject with    weird  white   spaces    ")

        expect(approachment.subject).to eq("This is a subject with weird white spaces")
      end
    end

    context "for message attribute" do
      it "does not save without a message" do
        invalid_approachment = build(:approachment, message: "")

        expect { invalid_approachment.save! }.to raise_error("Validation failed: Message can't be blank")
      end

      it "does not save if message has more than 3000 characters" do
        approachment_with_valid_message = build(:approachment, message: "message_with_3000_characters@example.com#{'m' * 2960}")
        approachment_with_invalid_message = build(:approachment, message: "message_with_3001_characters@example.com#{'m' * 2961}")

        expect { approachment_with_valid_message.save! }.not_to raise_error
        expect { approachment_with_invalid_message.save! }.to raise_error("Validation failed: Message is too long (maximum is 3000 characters)")
      end
    end
  end

  it "sends an email after create" do
    approachment = build(:approachment)
    expect(ActionMailer::Base.deliveries).to be_empty

    approachment.save!
    perform_enqueued_jobs(queue: ApplicationMailer.deliver_later_queue_name)

    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
