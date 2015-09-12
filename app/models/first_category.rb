class FirstCategory < ActiveRecord::Base

	include ModelModules::Category
	has_many :account_values
	has_many :second_categories, :dependent=>:destroy
	has_many :deal_items

	before_save :check_order
	before_destroy :check_deal_items


private
	def check_deal_items
		if self.deal_items.count >0
			return false
		end
	end

end
