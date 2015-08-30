class CreateAccountRecords < ActiveRecord::Migration
  def change
    create_table :account_records do |t|
    	t.date	:account_date
			t.string :location 	
			t.string :note
      t.timestamps null: false
    end
  end
end
