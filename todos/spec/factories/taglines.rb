FactoryBot.define do
  factory :tagline do
    text { Faker::Quote.matz }
    lang { 'English' }
    lang_code { 'en' }
  end
end
