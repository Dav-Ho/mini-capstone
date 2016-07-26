class CreateProducts < ActiveRecord::Migration

    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :color
      t.string :description

      t.timestamps null: false
    end
end
