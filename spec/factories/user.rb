FactoryBot.define do
    factory :user do
      sequence(:email) { |n| "test#{n}@sopha#{n}.com" }
      password { '123456789' }
    end
end
  