class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  #:confirmable, :omniauthable, :trackable, 
  include DeviseTokenAuth::Concerns::User

  validades :email, uniquess: true
  validades :email, :name, :password, presence: true
end
