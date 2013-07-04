class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :item_description
      t.string :lot_number
      t.string :reaction_kit
      t.string :reactions_used
      t.string :best_till
      t.string :opened
      t.string :comment

      t.timestamps
    end
  end
end
