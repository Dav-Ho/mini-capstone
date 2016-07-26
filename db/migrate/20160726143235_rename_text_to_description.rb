class RenameTextToDescription < ActiveRecord::Migration
  def change
    rename_column :products, :text, :description  
  end
end
