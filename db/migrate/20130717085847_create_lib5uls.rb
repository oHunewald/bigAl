class CreateLib5uls < ActiveRecord::Migration
  def change
    create_table :lib5uls do |t|
    	t.integer :pool_id
    	t.integer :library_id
    	t.float :value

      t.timestamps
    end
  end
end
