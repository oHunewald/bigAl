class AddProjectIdToMiane < ActiveRecord::Migration
  def change
  	add_column :mianes, :project_id, :integer
  end
end
