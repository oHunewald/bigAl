class AddPoolIdToUlDilution < ActiveRecord::Migration
  def change
    add_column :ul_dilutions, :pool_id, :integer
  end
end
