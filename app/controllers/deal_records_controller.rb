class DealRecordsController < ApplicationController

	def index
		@deal_records = DealRecord.includes(:deal_items)
	end

	def new
		@deal_record = DealRecord.new
		@deal_item = @deal_record.deal_items.new
		@deal_item.deal_payments.new
	end

	def create
		@deal_record = DealRecord.new(deal_record_params)
		if @deal_record.save
			redirect_to new_deal_record_path
		else
			render "deal_records/new"
		end
	end

private

	def deal_record_params
		params.require(:deal_record).permit(
										:date,:location,:description,
										:deal_items_attributes=>[:id, :amount, :description, :first_category_id,:second_category_id, :third_category_id],
										:deal_payments_attributes=>[:id, :amount, :account_entity_id, :account_owner_id])
	end

end
