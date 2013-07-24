class CreateInventoriesTemplatesJoinTable < ActiveRecord::Migration
  def up
  	create_table :inventories_templates, :id => false do |t|
  		t.integer :inventory_id
  		t.integer :template_id
  	end

  	add_index :inventories_templates, [:inventory_id, :template_id]
  end

  def down
  	drop_table :inventories_templates
  end
end
