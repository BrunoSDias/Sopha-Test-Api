User.destroy_all
Store.destroy_all

5.times do
    User.create name: "#{Faker::Artist.name}", email: "#{Faker::Artist.name}@gmail.com", password: "123456", password_confirmation: "123456"
    Store.create name: "Store for #{User.last.name}", user_id: User.last.id
end