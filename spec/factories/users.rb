FactoryBot.define do
  factory :user do
    name { "Jhon Doe" }
    email { "example@.com" }
    password_digest { "password" }
  end
end
