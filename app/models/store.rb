class Store < ApplicationRecord
    validates :user_id, presence: true
    belongs_to :user

    scope :search_store, -> (title) { where("LOWER(name) LIKE ?", "%#{title.downcase}%") if title.present? }
    scope :order_store_by_name, -> { order(:name) }
end
