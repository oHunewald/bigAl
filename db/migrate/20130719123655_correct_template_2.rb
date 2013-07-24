class CorrectTemplate2 < ActiveRecord::Migration
	def change
		change_table :templates do |t|
			t.remove :responsible_id, :integer
			t.integer :pool_id	
		end
	end
end
