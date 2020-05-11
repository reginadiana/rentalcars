class CarsController < ApplicationController

	def index
	    	@cars = Car.all
		@user = current_user
	end
	def show
	    	@car = Car.find(id)
		@user = current_user
	end
	def new
		@car = Car.new
		@car_models = CarModel.all
		@subsidiaries = Subsidiary.all
	end

        def create
		@car = Car.new(require_params)
            	if @car.save
			flash[:notice] = 'Carro criado com sucesso'	
	    		redirect_to @car
	    	else 
			@car_models = CarModel.all
			@subsidiaries = Subsidiary.all
			render :new
	    	end
	end
	def edit
		@car = Car.find(id)
		@car_models = CarModel.all
		@subsidiaries = Subsidiary.all
	end

	def update
		@car = Car.find(id)
		if @car.update(require_params)
			redirect_to @car
		else
			@car_models = CarModel.all
			@subsidiaries = Subsidiary.all
			render :edit
		end
	end

        def destroy
		@car = Car.find(id)
		@car.destroy

		redirect_to cars_path
	end

	private
	
	def require_params
		params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id)
	end

	def id
		params[:id]
	end
end
