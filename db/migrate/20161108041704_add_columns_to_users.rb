class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string, index: true
    add_column :users, :avatar, :string
    add_column :users, :role, :string
  end
end
