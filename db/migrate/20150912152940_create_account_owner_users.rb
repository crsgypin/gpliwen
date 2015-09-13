class CreateAccountOwnerUsers < ActiveRecord::Migration
  def change
    create_table :account_owner_users do |t|
    	t.integer :user_id, :index=>true
    	t.integer :account_owner_id, :index=>true
      t.timestamps null: false
    end
  end
end
