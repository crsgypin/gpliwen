class Setting::UsersController < ApplicationController

	def index
		@users = User.all
	end

	def update
		params[:users].each do |key,user_value|
			user = User.find(user_value['id'])
			user.update!(:account_owner_ids =>user_value['account_owner_ids'])
		end
		flash[:notice]="已儲存!!"
		redirect_to setting_users_path
	end

end
