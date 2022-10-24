class Store < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: { message: "A store with that name already exists" }
end
