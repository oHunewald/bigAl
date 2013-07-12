class RemoveLibFromPool < ActiveRecord::Migration
	def change
		change_table :pools do |t|
			t.remove :library_id, :integer

		end
	end
end
