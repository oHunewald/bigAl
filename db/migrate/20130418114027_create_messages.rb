class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :sender_id
      t.string :title
      t.string :context

      t.timestamps
    end
  end
end
