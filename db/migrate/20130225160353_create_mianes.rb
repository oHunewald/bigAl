class CreateMianes < ActiveRecord::Migration
  def change
    create_table :mianes do |t|
      t.string :aims
      t.string :expected_result
      t.string :why_ngs
      t.string :possible_alternative
      t.string :approach 
      t.string :positive_control
      t.string :negative_control
      t.string :replicates
      t.string :reference_dataset
      t.string :possible_pittfalls
      t.string :needs_qc
      
      t.timestamps
    end
  end
end
