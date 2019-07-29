class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :email, null:false
      t.string :password_digest, null:false
      t.integer :age, limit: 30
      t.integer :gender , limit: 1
      t.integer :residence, limit: 46
      t.text :description
      t.string :img
      t.boolean :admin, defalut:false

      t.timestamps
    end
    add_index :users, :email, unique:true
    add_index :users, [:age, :gender, :residence]
  end
end
