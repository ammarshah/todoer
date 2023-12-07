FactoryBot.define do
  factory :approachment do
    name    { Faker::Name.name }
    email   { Faker::Internet.email }
    subject { Faker::Lorem.sentence }
    message { Faker::Lorem.paragraph_by_chars(number: 3000) }
  end
end
