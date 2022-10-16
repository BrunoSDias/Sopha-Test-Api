class Store < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { minimum: 2 }
end
