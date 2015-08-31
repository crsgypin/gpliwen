class DealRecord < ActiveRecord::Base

	has_many :deal_items, :dependent => :destroy
	accepts_nested_attributes_for :deal_items, allow_destroy: true
	has_many :deal_payments, :through=>:deal_items
	accepts_nested_attributes_for :deal_payments, allow_destroy: true

	before_save :calculate_amount

private
	def calculate_amount
		self.amount = self.deal_items.inject(0){|sum, deal_item| sum + deal_item.amount}
	end

end
