class CreateDealPayments < ActiveRecord::Migration
  def change
    create_table :deal_payments do |t|
    	t.integer :deal_record_id, :index=>true
    	t.integer :amount
    	t.integer :account_entity_id, :index=>true
    	t.integer :account_owner_id, :index=>true
    	t.integer :proportion
      t.timestamps null: false
    end
  end
end
