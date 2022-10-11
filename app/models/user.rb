class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
end
