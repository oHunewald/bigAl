class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :number
      t.string :size_pcr
      t.integer :exp_size_incl_adaptors
      t.integer :size_with_adaptors
      t.integer :pmol
      t.integer :desired_concentration
      t.float :mix_1
      t.float :mix_2
      t.integer :sample_id

      t.timestamps
    end
  end
end
