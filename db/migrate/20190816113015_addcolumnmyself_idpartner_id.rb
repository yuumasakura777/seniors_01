class AddcolumnmyselfIdpartnerId < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :myself_id, :integer
    add_column :talks, :partner_id, :integer
  end
end
