class RemoveResidencefromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :residence, :integer
  end
end
