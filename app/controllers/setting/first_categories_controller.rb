class Setting::FirstCategoriesController < ApplicationController

	def index
		@first_categories = FirstCategory.order(:order)
		if params[:edit_id]
			@first_category = FirstCategory.find(params[:edit_id])
		else
			@first_category = FirstCategory.new
		end
	end

	def create
		@first_category = FirstCategory.new(first_category_params)
		@first_category.save!
		
		redirect_to setting_first_categories_path
	end

	def update
		@first_category = FirstCategory.find(params[:id])
		@first_category.update!(first_category_params)

		redirect_to setting_first_categories_path
	end

	def destroy
		@first_category = FirstCategory.find(params[:id])
		@first_category.destroy!

		redirect_to setting_first_categories_path		
	end

private

	def first_category_params
		params.require(:first_category).permit(:order,:name,:description)
	end

end
