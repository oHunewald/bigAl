class CorrectTemplate < ActiveRecord::Migration
	def change
		change_table :templates do |t|
			t.remove :commit, :string
			t.remove :ot_kit_used, :string
			t.remove :pmol_l, :float
			t.remove :pmol_l_pool, :float
			t.remove :pooling, :date
			t.remove :tdf, :string
			t.remove :tdf_pool, :string

			t.string :comment
			t.date :date_bioanalyser
			
		end
	end
end
