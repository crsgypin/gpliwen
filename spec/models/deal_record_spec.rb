require 'rails_helper'

RSpec.describe DealRecord, type: :model do

	describe "one deal_record save." do
		before do
			@deal_record = DealRecord.new(:date=>0.day.ago)
			@deal_record.deal_items.new(:first_category_id=>1,:second_category_id=>1,:amount=>500)
			@payment1 = @deal_record.deal_payments.new(:account_owner_id=>1,:amount=>400)
			@payment2 = @deal_record.deal_payments.new(:account_owner_id=>1,:amount=>100)
			@deal_record.save!
		end

		describe "after saving, " do
			it "deal record amount should be 500" do
				expect(@deal_record.amount).to eq(500)
			end

			it "payment1's proportion should be 80" do
				expect(@payment1.proportion).to eq(80)
			end

			it "payment2's proportion should be 20" do
				expect(@payment2.proportion).to eq(20)
			end

		end

	end
end
