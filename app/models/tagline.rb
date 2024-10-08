class Tagline < ApplicationRecord
  DEFAULT_TAGLINE = "Whaddya want todo?"

  validates :text,      presence: true,
                        uniqueness: true

  validates :lang,      presence: true

  validates :lang_code, presence: true
end
