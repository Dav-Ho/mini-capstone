class RemoveColumnQuantityToOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :quantity, :integer 
  end
end
