class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :name
      t.integer :size
      t.float :quantity

      t.timestamps
    end
  end
end
