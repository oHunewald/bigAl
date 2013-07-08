class ChangeInventories < ActiveRecord::Migration
	def change
		change_table :libraries do |t|
			t.remove :template_id, :integer

			t.integer :inventory_id
		end
	end
end
