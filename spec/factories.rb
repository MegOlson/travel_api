FactoryBot.define do
  factory :destination do
    city Faker::Address.city
    country Faker::Address.country
  end
  factory :review do
    author Faker::Name.name
    content Faker::Lorem.sentence(3)
    rating Faker::Number.between(1, 5)
    destination
  end
end
