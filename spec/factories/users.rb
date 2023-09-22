FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'johnversionx1' }
    password_confirmation { password }
    uid { email }
    provider { 'email' }

    factory :confirmed_user do
      confirmed_at { Time.current }
    end

    factory :user_without_uid do
      uid { '' }
    end
  end
end
