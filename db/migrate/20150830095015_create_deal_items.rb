class CreateDealItems < ActiveRecord::Migration
  def change
    create_table :deal_items do |t|
    	t.integer :deal_record_id, :index=>true
    	t.integer :amount
    	t.string :description
    	t.integer	:first_category_id, :index=>true
    	t.integer :second_category_id, :index=>true
    	t.integer :third_category_id, :index=>true

      t.timestamps null: false
    end
  end
end
