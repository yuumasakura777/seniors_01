class RemovecolumfWingfWer < ActiveRecord::Migration[5.2]
  def change
    remove_column :talks, :f_wing, :integer
    remove_column :talks, :f_wer, :integer
  end
end
