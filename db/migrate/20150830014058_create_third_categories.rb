class CreateThirdCategories < ActiveRecord::Migration
  def change
    create_table :third_categories do |t|
    	t.string :name
    	t.string :description
    	t.integer :second_categories, :index=>true
      t.timestamps null: false
    end
  end
end
