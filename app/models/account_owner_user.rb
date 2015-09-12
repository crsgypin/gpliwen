class AccountOwnerUser < ActiveRecord::Base
	belongs_to :account_owner
	belongs_to :user

end
