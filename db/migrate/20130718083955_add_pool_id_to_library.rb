class AddPoolIdToLibrary < ActiveRecord::Migration
  def change
    add_column :libraries, :pool_id, :integer
  end
end
