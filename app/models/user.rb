# frozen_string_literal: true

class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :validatable

  has_many :stores

  validates :name, presence: true
end
