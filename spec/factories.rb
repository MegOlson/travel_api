FactoryBot.define do
  factory :destination do
    city Faker::Address.city
    country Faker::Address.country
  end
end
