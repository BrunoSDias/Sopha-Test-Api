class Store < ApplicationRecord
  belongs_to :user

  validades :name, presence: true
end
