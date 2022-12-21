class Store < ApplicationRecord
    validates :user_id, presence: true
    belongs_to :user

    scope :search_store, -> (name) { where("LOWER(name) LIKE ?", "%#{name.downcase}%") if name.present? }
    scope :order_store_by_name, -> { order(:name) }
end
