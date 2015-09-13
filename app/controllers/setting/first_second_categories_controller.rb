class Setting::FirstSecondCategoriesController < ApplicationController
	before_action :set_first_category
	before_action :set_second_category, :only=>[:show,:edit,:update,:destroy]

	def index
		@second_categories = @first_category.second_categories
	end

	def new 
		@second_category = @first_category.second_categories.new
		@third_categories = @second_category.third_categories
		@third_categories.new
		render 'setting/first_second_categories/form.html'
	end

	def create
		@second_category = @first_category.second_categories.new(second_category_params)
		@second_category.save!

		redirect_to setting_first_category_second_categories_path(@first_category)
	end
	

	def edit
		@third_categories = @second_category.third_categories
		if @third_categories.count==0
			@third_categories.new
		end
		render 'setting/first_second_categories/form.html'
	end

	def update
		@second_category.update(second_category_params)
		redirect_to setting_first_category_second_categories_path(@first_category)
	end

	def destroy
		@second_category.destroy!
		redirect_to setting_first_category_second_categories_path(@first_category)		
	end

private

	def set_second_category
		@second_category = @first_category.second_categories.find(params[:id])
	end

	def set_first_category
		@first_category = FirstCategory.includes(:second_categories=>[:third_categories]).find(params[:first_category_id])
	end	

	def second_category_params
		params.require(:second_category).permit(:order,:name,:description,:third_categories_attributes=>[:id,:order,:name,:description,:_destroy])
	end

end
