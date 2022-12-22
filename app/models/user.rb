class User < ApplicationRecord

  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  include DeviseTokenAuth::Concerns::User

  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :name, presence: true

  scope :search_user, -> (user_name) { where("LOWER(name) LIKE ?", "%#{user_name.downcase}%") if user_name.present? }
  scope :order_user_by_name, -> { order(:name) }

  has_many :stores
  has_secure_password
  before_save { self.email = email.downcase }
end
