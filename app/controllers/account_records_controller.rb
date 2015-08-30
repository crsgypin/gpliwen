class AccountRecordsController < ApplicationController

	def index
		@account_records = AccountRecord.includes(:account_values)
	end

	def new
		@account_record = AccountRecord.new
		@account_record.account_values.new
	end

	def create
		@account_record = AccountRecord.new(account_record_params)
		if @account_record.save
			redirect_to new_account_record_path
		else
			render "account_records/new"
		end
	end

private

	def account_record_params
		params.require(:account_record).permit(:account_date,:location,:note,
										:account_values_attributes=>[:id,:account_record_id, :amount, :description, :first_category_id,
																			:second_category_id, :third_category_id, :from_account_id, :to_account_id])	
	end

end
