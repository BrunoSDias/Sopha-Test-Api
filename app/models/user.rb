class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :stores, dependent: :destroy

  validates :name, presence: true

  before_validation :set_uid

  private

  def set_uid
    email = self[:email]

    self[:uid] = email if self[:uid].blank? && email.present?
  end
end