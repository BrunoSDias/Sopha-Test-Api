class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  has_many :stores, dependent: :destroy

  devise :database_authenticatable, :registerable, :recoverable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: Devise::JWT::RevocationStrategies::Null

  validates :name,
            :email,
            :password,
            presence: true
end