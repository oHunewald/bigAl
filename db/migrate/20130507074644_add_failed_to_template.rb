class AddFailedToTemplate < ActiveRecord::Migration
  def change
  	add_column :templates, :failed, :boolean
  end
end
