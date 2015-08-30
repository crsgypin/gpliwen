class DealRecord < ActiveRecord::Base

	has_many :deal_items, :dependent => :destroy
	accepts_nested_attributes_for :deal_items, allow_destroy: true
	has_many :deal_payments, :dependent => :destroy
	accepts_nested_attributes_for :deal_payments, allow_destroy: true
	has_many :account_entities, :through=>:deal_payments
	has_many :account_owners, :through=>:deal_payments

	before_save :calculate_amount
	before_save :calculate_proportion

private
	def calculate_amount
		self.amount = self.deal_items.inject(0){|sum, deal_item| sum + deal_item.amount}
	end

	def calculate_proportion
		self.deal_payments.each do |payment|
			payment.proportion = payment.amount*100/self.amount
		end
	end

end
