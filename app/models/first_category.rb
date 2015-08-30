class FirstCategory < ActiveRecord::Base
	has_many :account_values
	has_many :second_categories

end
