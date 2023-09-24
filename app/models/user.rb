# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  include DeviseTokenAuth::Concerns::User

  # Associações
  has_many :stores

  # Validações
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Bcrypt
  #has_secure_password
end
