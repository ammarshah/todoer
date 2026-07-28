class Approachment < ApplicationRecord
  validates :name,  presence: true,
                    length:   { maximum: 80 }

  validates :email, presence: true,
                    length:   { maximum: 150 },
                    format:   { with: EmailAddress::FORMAT, allow_blank: true }

  validates :subject, presence: true,
                      length: { maximum: 150 }

  validates :message, presence: true,
                      length: { maximum: 3000 }

  normalizes :name, :email, :subject, with: ->(field) { field.squish }

  after_create :notify_us

  private

  def notify_us
    ApproachmentMailer.notify_us(self).deliver_later
  end
end
