class ReworkLibrary < ActiveRecord::Migration
	def change
		change_table :templates do |t|
			t.remove :shearing_kit, :integer
			t.remove :fragment_kit, :integer
			t.remove :mid_kit, :integer
		end
	end
end
