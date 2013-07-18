class AddPriceToInventory < ActiveRecord::Migration
  def change
  	add_column :inventories, :price, :float
  end
end
