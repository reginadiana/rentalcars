class CarsController < ApplicationController
	def index
	    	@cars = Car.all
	end
	def show
	    	@car = Car.find(id)
	end

	private
	
	def require_params
		params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id)
	end

	def id
		params[:id]
	end
end
