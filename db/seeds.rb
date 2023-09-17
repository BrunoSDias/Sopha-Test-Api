# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb

User.delete_all
Store.delete_all

# Criando 10 usuários
10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password123', # para simplicidade, usando uma senha comum
    password_confirmation: 'password123'
  )

  # Criando entre 1 e 5 lojas para cada usuário
  rand(1..5).times do
    Store.create!(
      name: Faker::Company.name,
      user: user
    )
  end
end

puts "10 users and their associated stores created!"
