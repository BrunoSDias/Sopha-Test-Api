FactoryBot.define do
  factory :store do
    sequence(:name) { |n| "Loja teste#{n}" }
    user { nil }
  end
end
