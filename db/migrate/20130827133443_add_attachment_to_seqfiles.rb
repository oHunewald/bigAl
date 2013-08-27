class AddAttachmentToSeqfiles < ActiveRecord::Migration

  def change
  	add_column :seqfiles, :attachment_file_name, :string
  	add_column :seqfiles, :attachment_content_type, :string
  	add_column :seqfiles, :attachment_file_size, :integer
  	add_column :seqfiles, :attachment_updated_at, :datetime
  end  	

end
