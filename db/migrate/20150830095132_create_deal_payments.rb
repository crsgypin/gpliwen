class CreateDealPayments < ActiveRecord::Migration
  def change
    create_table :deal_payments do |t|  
    	t.integer :amount
    	t.integer :account_entity_id, :index=>true
    	t.integer :account_owner_id, :index=>true
      t.integer :deal_item_id, :index=>true
      t.timestamps null: false
    end
  end
end
