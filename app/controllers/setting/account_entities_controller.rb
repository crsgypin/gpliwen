class Setting::AccountEntitiesController < ApplicationController
	before_action :set_account_entity, :only=>[:update, :destroy]

	def index
		@account_entities = current_user.account_entities
		if params[:edit_id]
			@account_entity = AccountEntity.find(params[:edit_id])
		else
			@account_entity = AccountEntity.new
		end
		@account_owners = current_user.account_owners
	end

	def create
		@account_entity = AccountEntity.new(account_entity_params)
		@account_entity.save!
		redirect_to setting_account_entities_path
	end

	def update
		@account_entity.update!(account_entity_params)
		redirect_to setting_account_entities_path
	end

	def destroy
		@account_entity.destroy!
		redirect_to setting_account_entities_path
	end

private
	def set_account_entity
		@account_entity = AccountEntity.find(params[:id])
	end

	def account_entity_params
		params.require(:account_entity).permit(:name, :description,:account_owner_id)

	end

end
