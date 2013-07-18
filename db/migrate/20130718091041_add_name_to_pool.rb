class AddNameToPool < ActiveRecord::Migration
  def change
    add_column :pools, :name, :string
  end
end
