class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_many :stores, class_name: "store", foreign_key: "reference_id"
end
