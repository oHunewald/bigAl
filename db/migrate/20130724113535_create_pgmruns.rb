class CreatePgmruns < ActiveRecord::Migration
  def change
    create_table :pgmruns do |t|
    	t.integer :template_id
    	t.date :run_date
    	t.date :ot_date
    	t.string :initialisation
    	t.string :run_number
    	t.string :pgm_number
    	t.integer :mean_read_length
    	t.integer :perc_loading
    	t.integer :keysignal
    	t.integer :final_lib_reads
    	t.integer :perc_low_quality
    	t.string :testfragment
    	t.string :ts_version
    	t.string :comment
    	t.integer :user_id

      t.timestamps
    end
  end
end
