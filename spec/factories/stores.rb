FactoryBot.define do
  factory :store do
    name { Faker::Name.name }
    user

    factory :invalid_store do
      name { nil }
    end
  end
end
