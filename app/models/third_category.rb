class ThirdCategory < ActiveRecord::Base
	include ModelModules::Category
	has_many :account_values
	has_many :deal_items
	belongs_to :second_category

	before_save :check_order

end
