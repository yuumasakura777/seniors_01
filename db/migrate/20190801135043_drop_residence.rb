class DropResidence < ActiveRecord::Migration[5.2]
  def change
    drop_table :residences
  end
end
