class FirstCategory < ActiveRecord::Base
	has_many :account_values
	has_many :second_categories
	has_many :deal_items

	before_save :check_order

private
	def check_order
		if !self.order.present?
			class_name = "FirstCategory"
			self.order = (class_name.constantize.maximum(:order)||0) +1
		end
	end

end
