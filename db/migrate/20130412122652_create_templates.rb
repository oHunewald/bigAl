class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :ot_kit_used
      t.float :pmol_l
      t.string :tdf
      t.date :pooling
      t.float :pmol_l_pool
      t.string :tdf_pool
      t.string :qbit_before_es
      t.string :qbit_after_es
      t.string :commit
      t.integer :user_id

      t.timestamps
    end
  end
end
