class AddProjectIdToSample < ActiveRecord::Migration
  def change
  	add_column :samples, :project_id, :integer
  end
end
