class AccountOwner < ActiveRecord::Base
	has_many :deal_payments
	has_many :account_entities
end
