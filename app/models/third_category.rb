class ThirdCategory < ActiveRecord::Base
	has_many :account_values
	belongs_to :second_category
end
