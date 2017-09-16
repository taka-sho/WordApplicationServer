class AddOmniauthColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :authority, :integer, null: false, default: 0

    add_index :users, [:uid, :provider], unique: true
  end
end
