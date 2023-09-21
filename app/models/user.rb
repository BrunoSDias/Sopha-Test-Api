# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User
end
