class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :subtotal
      t.integer :tax
      t.integer :total

      t.timestamps null: false
    end
  end
end
