class CreateDealRecordUserUpdates < ActiveRecord::Migration
  def change
    create_table :deal_record_user_updates do |t|
    	t.integer :user_id, :index=>true
    	t.integer :deal_record_id, :index=>true

      t.timestamps null: false
    end
  end
end
