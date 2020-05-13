class CarRentalsController < ApplicationController
	def new
		@rental = Rental.find(params[:rental_id])
		@car_rental = CarRental.new
		@cars = Car.where.not(status: :unavailable)
		@add_ons = AddOn.all
	end

	def create
		@rental = Rental.find(params[:rental_id])

		@car_rental = CarRental.new(params.require(:car_rental).permit(:car_id, :add_on_id))
		@car_rental.user = current_user
		@car_rental.rental = @rental

		@car_rental.save!
		@rental.ongoing!
		@car_rental.car.unavailable!
    
		redirect_to @rental
	end

	def destroy
		@rental = Rental.find(params[:rental_id])
		@rental.closed!
		
		redirect_to customer_path(params[:rental_id])
		flash[:alert] = "Locação encerrada"	
	end
end
