class UsersController < ApplicationController

	def sign_in
		render "users/sign_with_FB"
	end

end
