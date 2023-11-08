FactoryBot.define do
  factory :user do
    full_name { Faker::Name.name }
    email     { Faker::Internet.email }
    password  { Faker::Internet.password(min_length: 8, max_length: 70) }

    trait :confirmed do
      confirmed_at { DateTime.now }
    end
  end
end
