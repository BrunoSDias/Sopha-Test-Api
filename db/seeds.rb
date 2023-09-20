require 'faker'

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'johnversion'
  )
end

users = User.all
users.each do |user|
  3.times do
    Store.create(
      name: "Loja de #{user.name}",
      user: user
    )
  end
end
