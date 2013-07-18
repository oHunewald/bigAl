class ChangeLibNumberToLib5Ul < ActiveRecord::Migration
	def change
		change_table :lib_5ul_low_te_buffers do |t|
			t.remove :lib_name, :string
			t.integer :library_id
		end
	end
end
