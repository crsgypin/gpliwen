class AddOrderToCategories < ActiveRecord::Migration
  def change
  	add_column :first_categories, :order, :integer
  	add_column :second_categories, :order, :integer
  	add_column :third_categories, :order, :integer
  end
end
