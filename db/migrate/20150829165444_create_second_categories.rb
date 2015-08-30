class CreateSecondCategories < ActiveRecord::Migration
  def change
    create_table :second_categories do |t|
    	t.string :name
    	t.string :description
    	t.integer :first_category_id, :index=>true
      t.timestamps null: false
    end
  end
end
