class CreateLibrariesInventoriesJoinTable < ActiveRecord::Migration
  def up
  	create_table :libraries_inventories, :id => false do |t|
  		t.integer :library_id
  		t.integer :inventory_id
  	end

  	add_index :libraries_inventories, [:library_id, :inventory_id]
  end

  def down
  	drop_table :libraries_inventories
  end
end
