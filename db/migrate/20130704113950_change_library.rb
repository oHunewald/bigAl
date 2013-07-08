class ChangeLibrary < ActiveRecord::Migration
	def change
		change_table :libraries do |t|
			t.remove :number, :string
			t.remove :size_pcr, :string
			t.remove :exp_size_incl_adaptors, :integer
			t.remove :size_with_adaptors, :integer
			t.remove :pmol, :integer
			t.remove :desired_concentration, :integer
			t.remove :mix_1, :float
			t.remove :mix_2, :float

			t.date :lib_date
			t.float :ul_used
			t.integer :target_size
			t.float :quantity
			t.integer :mid
			t.integer :shearing_min
			t.boolean :end_repair_done
			t.string :number_of_bands_in_eGel
			t.integer :cycles_of_amplification
			t.date :date_bioanalyser
			t.string :pmol_before
			t.string :pmol_after
			t.string :comment
		end
	end
end
