class SecondCategory < ActiveRecord::Base
	has_many :account_values
	has_many :third_categories
	belongs_to :first_category
		
end
