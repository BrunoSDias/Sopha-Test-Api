class Store < ApplicationRecord
  belongs_to :user, class_name: 'User'
  validates :name, presence: true
end
