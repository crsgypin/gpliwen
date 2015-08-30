class DealItem < ActiveRecord::Base
	belongs_to :account_record
	belongs_to :first_category
	belongs_to :second_category
	belongs_to :third_category
	delegate :name, :to=>:first_category, :prefix=>true, :allow_nil=>true
	delegate :name, :to=>:second_category, :prefix=>true, :allow_nil=>true
	delegate :name, :to=>:third_category, :prefix=>true, :allow_nil=>true

end
