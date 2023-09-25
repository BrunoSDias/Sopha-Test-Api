class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.bigint :user_id, null: false

      t.timestamps null: false
    end

    add_foreign_key :stores,
              :users,
                    column: :user_id,
                    name: 'stores_user_id_fkey'
  end
end
