class AddOmniauthToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_provider, :string
    add_index :users, :auth_provider
    add_column :users, :auth_uid, :string
    add_index :users, :auth_uid
    add_column :users, :auth_token, :string
    add_column :users, :auth_raw_data, :text
    add_column :users, :avatar, :string
  end
end
