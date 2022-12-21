class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true
    has_many :stores

    scope :search_user, -> (user) { where("LOWER(name) LIKE ?", "%#{user.downcase}%") if user.present? }
    scope :order_user_by_name, -> { order(:name) }
end
