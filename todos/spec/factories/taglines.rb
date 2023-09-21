FactoryBot.define do
  factory :tagline do
    text { Faker::Quote.matz }
  end
end
