class Approachment < ApplicationRecord
  include EmailRegex

  validates :name,  presence: true,
                    length:   { maximum: 80 }

  validates :email, presence: true,
                    length:   { maximum: 150 },
                    format:   { with: EMAIL_REGEX, allow_blank: true }

  validates :subject, presence: true,
                      length: { maximum: 150 }

  validates :message, presence: true,
                      length: { maximum: 3000 }

  before_validation :squish_fields
  after_create :notify_us

  private

  def squish_fields
    self.name.to_s.squish!
    self.email.to_s.squish!
    self.subject.to_s.squish!
  end

  def notify_us
    ApproachmentMailer.notify_us(self).deliver_later
  end
end
