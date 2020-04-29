class CarModelsController < ApplicationController
	def index
		@car_models = CarModel.all
	end
	def show
		@car_model = CarModel.find(id)
	end
	def new
		@car_model = CarModel.new
		@manufacturers = Manufacturer.all
		@car_categories = CarCategory.all	
	end
	def create
		@car_model = CarModel.create(require_params)
		if @car_model.save
			redirect_to @car_model
		else
			@manufacturers = Manufacturer.all
			@car_categories = CarCategory.all
			render :new
		end
	end
	def edit
		@car_model = CarModel.find(id)
		@manufacturers = Manufacturer.all
		@car_categories = CarCategory.all
	end

	def update
		@car_model = CarModel.find(id)
		if @car_model.update(require_params)
			redirect_to @car_model
		else
			@manufacturers = Manufacturer.all
			@car_categories = CarCategory.all
			render :edit
		end
	end

	private
	
	def require_params
		params.require(:car_model).permit(:name, :year, :manufacturer_id,
				:motorization, :fuel_type, :car_category_id)
	end

	def id
		params[:id]
	end
end
