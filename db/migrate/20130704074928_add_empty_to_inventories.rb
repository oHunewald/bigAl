class AddEmptyToInventories < ActiveRecord::Migration
  def change
  	add_column :inventories, :empty, :boolean
  	change_column :inventories, :reaction_kit, :integer
  	change_column :inventories, :reactions_used, :integer
  	change_column :inventories, :best_till, :date
  	change_column :inventories, :opened, :date
  end
end
