class RemoveResidenceFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :residence_id, :integer
  end
end
