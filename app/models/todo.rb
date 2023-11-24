class Todo < ApplicationRecord
  validates :title, presence: true,
                    length:   { maximum: 1000 }
end
