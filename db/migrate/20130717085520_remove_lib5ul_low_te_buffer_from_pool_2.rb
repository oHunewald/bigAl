class RemoveLib5ulLowTeBufferFromPool2 < ActiveRecord::Migration
	def change
		change_table :pools do |t|
			t.remove :lib5ulLowTeBuffers, :float

		end
	end
end
