class AddShearKitToLibrary < ActiveRecord::Migration
  def change
		change_table :libraries do |t|
			t.string :shearing_kit
			t.string :fragment_kit
			t.string :e_gel
		end
  end
end
