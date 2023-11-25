class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
                    length:   { maximum: 1000 }

  validates :completed, inclusion: { in: [true, false] }

  before_validation :squish_title

  scope :incomplete, -> { where(completed: false) }
  scope :completed,  -> { where(completed: true) }

  private

  def squish_title
    self.title.to_s.squish!
  end
end
