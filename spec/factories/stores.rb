FactoryBot.define do
  factory :store do
    name { Faker::Company.name }
    user_id { user.id }
    user

    factory :store_without_name do
      name { '' }
    end
  end
end
