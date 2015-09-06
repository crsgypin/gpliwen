class DealRecord < ActiveRecord::Base

	has_many :deal_items, :dependent => :destroy
	accepts_nested_attributes_for :deal_items, allow_destroy: true
	has_many :deal_payments, :through=>:deal_items
	accepts_nested_attributes_for :deal_payments, allow_destroy: true

	before_save :check_deal_item_amount
	before_save :calculate_amount


	def display_date
		self.date.strftime(('%m月%d日'))
	end

	def payment_list
		payment_entities = []
		self.deal_items.each do |deal_item|
			deal_item.deal_payments.each do |deal_payment|
				payment_entities << deal_payment.account_entity
			end
		end
		payment_entities.uniq
	end

private
	def check_deal_item_amount
		self.deal_items.each do |deal_item|
			if deal_item.amount==nil 
				deal_item.amount = 0
			end
		end
	end

	def calculate_amount
		self.amount = self.deal_items.inject(0){|sum, deal_item| sum + deal_item.amount}
	end

end
