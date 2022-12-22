class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :name, :password, presence: true
    has_many :stores

    scope :search_user, -> (user) { where("LOWER(name) LIKE ?", "%#{user.downcase}%") if user.present? }
    scope :order_user_by_name, -> { order(:name) }
end
