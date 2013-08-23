class CreateMyfiles < ActiveRecord::Migration
  def change
    create_table :myfiles do |t|
      t.string :name
      t.string :path
      t.integer :project_id
      t.string :category

      t.timestamps
    end
  end
end
