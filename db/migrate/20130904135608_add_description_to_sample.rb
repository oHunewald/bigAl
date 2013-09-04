class AddDescriptionToSample < ActiveRecord::Migration
  def change
    add_column :samples, :description, :string
  end
end
