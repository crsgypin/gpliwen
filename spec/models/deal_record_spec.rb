require 'rails_helper'

RSpec.describe DealRecord, type: :model do

	describe "one deal_record is saved." do
		before do
			@deal_record = DealRecord.new(:date=>0.day.ago)
			@deal_item = @deal_record.deal_items.new(:first_category_id=>1,:second_category_id=>1,:amount=>500)
			@payment1 = @deal_item.deal_payments.new(:account_owner_id=>1,:amount=>400)
			@payment2 = @deal_item.deal_payments.new(:account_owner_id=>1,:amount=>100)
			@deal_record.save!
		end

		it "and deal deal_recrod amount should be 500" do
			expect(@deal_record.amount).to eq(500)
		end

		it "all data will be saved" do
			expect(DealRecord.count).to eq(1)
			expect(DealItem.count).to eq(1)
			expect(DealPayment.count).to eq(2)
		end


		describe "then destroy, " do
			before do
				@deal_record.destroy!
			end

			it "all would be destroyed" do
				expect(DealRecord.count).to eq(0)
				expect(DealItem.count).to eq(0)
				expect(DealPayment.count).to eq(0)
			end
		end

	end
end
