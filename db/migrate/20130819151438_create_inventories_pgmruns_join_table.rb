class CreateInventoriesPgmrunsJoinTable < ActiveRecord::Migration
  def up
  	create_table :inventories_pgmruns, :id => false do |t|
  		t.integer :inventory_id
  		t.integer :pgmrun_id
  	end

  	add_index :inventories_pgmruns, [:inventory_id, :pgmrun_id]  	
  end

  def down
  	drop_table :inventories_pgmruns
  end
end
