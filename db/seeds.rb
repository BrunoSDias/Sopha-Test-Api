User.destroy_all
Store.destroy_all

5.times do
    User.create name: Faker::Artist.name, email: Faker::Internet.email, password: "johnversionx1", password_confirmation: "johnversionx1"
    Store.create name: "Store for #{User.last.name}", user_id: User.last.id
end