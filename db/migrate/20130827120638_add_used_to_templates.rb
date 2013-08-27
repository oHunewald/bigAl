class AddUsedToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :used, :boolean
  end
end
