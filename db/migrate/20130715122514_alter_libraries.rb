class AlterLibraries < ActiveRecord::Migration
	def change
		change_table :libraries do |t|
			t.change :shearing_kit, :integer
			t.change :fragment_kit, :integer
		end
	end
end
