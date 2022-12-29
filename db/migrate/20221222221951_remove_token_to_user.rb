class RemoveTokenToUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :token
  end
end
