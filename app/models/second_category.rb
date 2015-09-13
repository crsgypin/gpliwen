class SecondCategory < ActiveRecord::Base
	include ModelModules::Category
	has_many :account_values
	has_many :third_categories, :dependent=>:destroy
	has_many :deal_items
	belongs_to :first_category
	accepts_nested_attributes_for :third_categories, :allow_destroy=>true

	before_save :check_order

		
end
