class AccountValue < ActiveRecord::Base
	belongs_to :account_record
	belongs_to :first_category
	belongs_to :second_category
	belongs_to :third_category
	belongs_to :from_account, :class_name=>"Account", :foreign_key=>"from_account_id"
	belongs_to :to_account, :class_name=>"Account", :foreign_key=>"to_account_id"

end
