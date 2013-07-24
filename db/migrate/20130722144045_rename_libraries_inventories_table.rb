class RenameLibrariesInventoriesTable < ActiveRecord::Migration
    def change
        rename_table :libraries_inventories, :inventories_libraries
    end 
end
