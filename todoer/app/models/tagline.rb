class Tagline < ApplicationRecord
  validates :text,      presence: true,
                        uniqueness: true

  validates :lang,      presence: true

  validates :lang_code, presence: true

  def self.random(exclude_id: nil)
    Tagline.where.not(id: exclude_id)
      .order("RANDOM()")
      .first
  end
end
