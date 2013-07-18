class RemoveCategoryFromInventory < ActiveRecord::Migration
	def change
		change_table :inventories do |t|
			t.remove :category, :string

		end
	end
end
