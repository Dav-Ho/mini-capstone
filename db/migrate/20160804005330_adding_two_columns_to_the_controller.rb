class AddingTwoColumnsToTheController < ActiveRecord::Migration
  def change
    add_column :products, :status, :string
    add_column :products, :order_id, :integer   
  end
end
