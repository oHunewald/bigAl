class AddPoolIdToMyfiles < ActiveRecord::Migration
  def change
    add_column :myfiles, :pool_id, :integer
  end
end
