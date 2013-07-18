class AddLibraryIdToLib5ul < ActiveRecord::Migration
  def change
  	add_column :lib_5ul_low_te_buffers, :pool_id, :integer
  end
end
