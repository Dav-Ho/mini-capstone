class ChangeDescription < ActiveRecord::Migration
  def change
    rename_column :products, :description, :text
  end
end
