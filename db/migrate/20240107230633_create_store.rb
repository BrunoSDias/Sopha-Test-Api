class CreateStore < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.references :user, foreign_key: true
    end
  end
end
