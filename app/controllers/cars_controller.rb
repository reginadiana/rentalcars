class CarsController < ApplicationController

	def index
	    	@cars = Car.all
	end
	def show
	    	@car = Car.find(id)
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

	private
	
	def require_params
		params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id)
	end

	def id
		params[:id]
	end
end
