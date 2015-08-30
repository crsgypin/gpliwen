class CreateAccountOwners < ActiveRecord::Migration
  def change
    create_table :account_owners do |t|
    	t.string :name
    	t.string :description
      t.timestamps null: false
    end
  end
end
