class AddReadyToPool < ActiveRecord::Migration
  def change
    add_column :pools, :ready, :boolean
  end
end
