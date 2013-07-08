class AddLibNumberToLibraries < ActiveRecord::Migration
  def change
  	add_column :libraries, :lib_number, :string
  end
end
