class AccountRecord < ActiveRecord::Base
	has_many :account_values
	accepts_nested_attributes_for :account_values, allow_destroy: true
	
end
