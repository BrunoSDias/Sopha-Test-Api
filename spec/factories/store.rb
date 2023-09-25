FactoryBot.define do
  factory :store do
    name { "Sample Store" }

    association :user
  end
end