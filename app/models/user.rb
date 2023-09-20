class User < ApplicationRecord
  has_secure_password
  has_many :stores, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
