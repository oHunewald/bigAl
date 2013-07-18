class AddMidKitToLibrary < ActiveRecord::Migration
  def change
    add_column :libraries, :mid_kit, :integer
  end
end
