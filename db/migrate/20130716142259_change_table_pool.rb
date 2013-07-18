class ChangeTablePool < ActiveRecord::Migration
	def change
		change_table :pools do |t|
			t.remove :lib_5ul_low_te_buffers, :float
			t.remove :ul_dilutions, :integer

		end
	end
end
