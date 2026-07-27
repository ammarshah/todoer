class Todo < ApplicationRecord
  belongs_to :user

  acts_as_list scope: [ :user_id, :completed ]

  validates :title, presence: true,
                    length:   { maximum: 1000 }

  validates :completed, inclusion: { in: [ true, false ] }

  normalizes :title, with: ->(title) { title.squish }

  scope :incomplete, -> { where(completed: false).order(position: :asc) }
  scope :completed,  -> { where(completed: true).order(position: :desc) }
end
