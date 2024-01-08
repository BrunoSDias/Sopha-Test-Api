FactoryBot.define do
  factory :store do
    name { 'Sample Store' }
    association :user

    trait :with_user do
      association :user, factory: :user
    end
  end
end