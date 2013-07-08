class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.integer :template_id
      t.integer :library_id
      t.date :date_pooling
      t.float :pmol_l
      t.float :tdf
      t.timestamps
    end
  end
end
