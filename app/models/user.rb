
class User < ApplicationRecord
   # Associações
  has_many :stores

  # Validações
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  # Bcrypt
  has_secure_password
end
