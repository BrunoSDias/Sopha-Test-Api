class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :name, :password, presence: true
    has_many :stores

    scope :search_user, -> (user_name) { where("LOWER(name) LIKE ?", "%#{user_name.downcase}%") if user_name.present? }
    scope :order_user_by_name, -> { order(:name) }
end
