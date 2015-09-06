class DealPayment < ActiveRecord::Base
	belongs_to :account_entity
	belongs_to :account_owner
	belongs_to :deal_item

end
