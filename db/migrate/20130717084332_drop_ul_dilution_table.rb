class DropUlDilutionTable < ActiveRecord::Migration
  def up
    drop_table :ul_dilutions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
