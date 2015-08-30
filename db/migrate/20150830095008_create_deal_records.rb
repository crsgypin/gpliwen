class CreateDealRecords < ActiveRecord::Migration
  def change
    create_table :deal_records do |t|
    	t.date	:date
			t.integer :amount
			t.string :location 	
			t.string :description
			t.string :type
      t.timestamps null: false
    end
  end
end
