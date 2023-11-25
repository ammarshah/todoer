FactoryBot.define do
  factory :todo do
    title { "Buy " + Faker::Food.fruits }
    user

    trait :completed do
      completed { true }
    end
  end
end
