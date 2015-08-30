class DealPayment < ActiveRecord::Base
	belongs_to :account_enitity
	belongs_to :account_owner
	belongs_to :deal_record
end
