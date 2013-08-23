class AddAttachmentToMyFiles < ActiveRecord::Migration
  def change
  	add_column :myfiles, :attachment_file_name, :string
  	add_column :myfiles, :attachment_content_type, :string
  	add_column :myfiles, :attachment_file_size, :integer
  	add_column :myfiles, :attachment_updated_at, :datetime
  end
end
