class Store < ApplicationRecord
  belongs_to :user, class_name: 'User'
  validates :name, presence: true
  validates :user_id, presence: true
end
