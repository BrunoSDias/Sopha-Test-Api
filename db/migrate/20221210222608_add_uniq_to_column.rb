# frozen_string_literal: true

class AddUniqToColumn < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true
  end
end
