class DealRecordsController < ApplicationController
	before_action :check_current_user

	def index
		@deal_records = DealRecord.includes(:deal_items =>[:first_category, :second_category, :third_category, 
																				:deal_payments=>[:account_owner,:account_entity=>[:account_owner]]])
		@deal_records = @deal_records.page(params[:page]).per(10)
	end

	def show
		@deal_record = DealRecord.find(params[:id])
	end

	def new
		@deal_record = DealRecord.new
		@deal_item = @deal_record.deal_items.new
		@deal_item.deal_payments.new
		render 'deal_records/form.html'
	end

	def create
		@deal_record = DealRecord.new(deal_record_params)
		if @deal_record.save
			redirect_to deal_record_path(@deal_record)
		else
			render "deal_records/new"
		end
	end

	def edit
		@deal_record = DealRecord.find(params[:id])
		render 'deal_records/form.html'		
	end

	def update
		@deal_record = DealRecord.find(params[:id])
		@deal_record.update!(deal_record_params)
		redirect_to deal_record_path(@deal_record)
	end

private

	def deal_record_params
		params.require(:deal_record).permit(
										:date,:location,:description,
										:deal_items_attributes=>[:id, :amount, :description, :first_category_id,:second_category_id, :third_category_id,
										:deal_payments_attributes=>[:id, :amount, :account_entity_id, :account_owner_id]])
	end
end
