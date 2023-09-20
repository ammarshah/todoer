FactoryBot.define do
  factory :todo do
    title { "Buy " + Faker::Food.fruits }
  end
end
