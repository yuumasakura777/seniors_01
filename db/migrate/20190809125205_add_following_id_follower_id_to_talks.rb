class AddFollowingIdFollowerIdToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :f_wing, :integer
    add_column :talks, :f_wer, :integer
  end
end
