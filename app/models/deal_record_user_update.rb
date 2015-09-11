class DealRecordUserUpdate < ActiveRecord::Base
	belongs_to :deal_record
	belongs_to :user

end
