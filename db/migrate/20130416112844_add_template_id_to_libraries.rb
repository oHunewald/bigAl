class AddTemplateIdToLibraries < ActiveRecord::Migration
  def change
    add_column :libraries, :template_id, :integer
  end
end
