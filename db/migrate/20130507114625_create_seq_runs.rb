class CreateSeqRuns < ActiveRecord::Migration
  def change
    create_table :seq_runs do |t|
      t.string :name
      t.string :kit
      t.string :chip
      t.date :seq_date

      t.timestamps
    end
  end
end
