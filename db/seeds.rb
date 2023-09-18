# db/seeds.rb

User.delete_all
Store.delete_all

# Criando 10 usuários
10.times do
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: 'password123',  # Use 'password' em vez de 'encrypted_password'
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
