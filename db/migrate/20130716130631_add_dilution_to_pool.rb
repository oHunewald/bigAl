class AddDilutionToPool < ActiveRecord::Migration
  def change
  	add_column :pools, :lib_5ul_low_te_buffer, :float
  	add_column :pools, :ul_dilution, :integer
  	add_column :pools, :bioanalyser_qbit, :float
  	add_column :pools, :tdf_used, :float
  end
end
