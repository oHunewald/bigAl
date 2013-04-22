class AddArchiveToSharedmessage < ActiveRecord::Migration
  def change
    add_column :sharedmessages, :archive, :boolean
  end
end
