# frozen_string_literal: true

class AddUneqToStoresColumn < ActiveRecord::Migration[5.1]
  def change
    add_index :stores, :name, unique: true
  end
end
