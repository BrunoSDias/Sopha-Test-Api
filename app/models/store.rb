class Store < ApplicationRecord
  # Associações
  belongs_to :user, class_name: 'User'

  # Validações
  validates :name, presence: true
end
