class AddResponsibleToTemplates < ActiveRecord::Migration
  def change
    add_column :templates, :responsible_id, :integer
  end
end
