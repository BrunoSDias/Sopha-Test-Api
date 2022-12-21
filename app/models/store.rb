class Store < ApplicationRecord
    validates :user_id, presence: true
    belongs_to :user

    scope :order_store_by_name, -> { order(:name) }
end
