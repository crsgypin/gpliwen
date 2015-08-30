class CreateAccountValues < ActiveRecord::Migration
  def change
    create_table :account_values do |t|
    	t.integer :account_record_id, :index=>true
    	t.integer :amount
    	t.string :description
    	t.integer	:first_category_id, :index=>true
    	t.integer :second_category_id, :index=>true
    	t.integer :third_category_id, :index=>true
    	t.integer :from_account_id, :index=>true
    	t.integer :to_account_id, :index=>true

      t.timestamps null: false
    end
  end
end
