class AddContructToMiane < ActiveRecord::Migration
  def change
    add_column :mianes, :construct, :string
  end
end
