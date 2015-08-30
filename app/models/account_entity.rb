class AccountEntity < ActiveRecord::Base
	belongs_to :account_owner
	has_many :deal_payments
end
