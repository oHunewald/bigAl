class AddTagfieldToMyfile < ActiveRecord::Migration
  def change
    add_column :myfiles, :tagfield, :string
  end
end
