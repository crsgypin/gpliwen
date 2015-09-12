class ModifyThirdCategory < ActiveRecord::Migration
  def change
  	remove_index :third_categories, :second_categories
  	rename_column :third_categories, :second_categories, :second_category_id
  	add_index :third_categories, :second_category_id
  end
end
