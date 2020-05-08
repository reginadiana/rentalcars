class CarRentalsController < ApplicationController
	def new
		@rental = Rental.find(id)
		@car_rental = CarRental.new
		@cars = @rental.car_category.cars 
		@customers = @rental.customer 
	end

	def create
		@rental = Rental.find(id)
		@car_rental = CarRental.new(require_params)
		@car_rental.user = current_user
		@car_rental.rental = @rental
		@car_rental.save!

		redirect_to @rental
	end

	private

	def id
		params[:rental_id]
	end
	
	def require_params
		params.require(:car_rental).permit(:car_id, :customer_id)
	end
end 
