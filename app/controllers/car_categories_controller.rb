class CarCategoriesController < ApplicationController
	def index
		@car_categories = CarCategory.all
	end
	def show
		@car_category = CarCategory.find(params[:id])
		#@car_models = CarModel.where(car_category: @car_category)
	end
	def new
		@car_category = CarCategory.new
	end
	def create
		@car_category = CarCategory.new(params.require(:car_category).permit(:name, :daily_rate, :car_insurance, :third_part_insurance))
		if @car_category.save	
	    		redirect_to @car_category
	    	else 
			render :new
	    	end
	end
end
