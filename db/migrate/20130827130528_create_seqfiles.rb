class CreateSeqfiles < ActiveRecord::Migration
  def change
    create_table :seqfiles do |t|
      t.string :category
      t.integer :pool_id

      t.timestamps
    end
  end
end
