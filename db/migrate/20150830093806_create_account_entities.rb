class CreateAccountEntities < ActiveRecord::Migration
  def change
    create_table :account_entities do |t|
    	t.string :name
    	t.string :description
    	t.integer :account_owner_id, :index=>true

      t.timestamps null: false
    end
  end
end
