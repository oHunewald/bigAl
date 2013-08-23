class CreateMyfilesTagsJoinTable < ActiveRecord::Migration
  def up
  	create_table :myfiles_tags, :id => false do |t|
  		t.integer :myfile_id
  		t.integer :tag_id
  	end

  	add_index :myfiles_tags, [:myfile_id, :tag_id]  	
  end

  def down
  	drop_table :myfiles_tags
  end
end
