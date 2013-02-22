class AddStateColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :state, :string
  end
end
