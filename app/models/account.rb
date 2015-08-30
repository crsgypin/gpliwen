class Account < ActiveRecord::Base
	belongs_to :owner, :class_name=>"User", :foreign_key=>:owner_id
	has_many :from_account_values, :class_name=>"AccountValue", :foreign_key=>"from_account_id"
	has_many :to_account_values, :class_name=>"AccountValue", :foreign_key=>"to_account_id"
	
end
