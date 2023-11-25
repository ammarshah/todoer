class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,
                    length:   { maximum: 1000 }

  before_validation :squish_title

  private

  def squish_title
    self.title.to_s.squish!
  end
end
