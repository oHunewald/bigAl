class RemoveEgelFromLibrary < ActiveRecord::Migration
	def change
		change_table :libraries do |t|
			t.remove :e_gel, :integer

		end
	end
end
