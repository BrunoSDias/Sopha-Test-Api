class AddUserRefereceToStore < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :stores, :users
  end
end
