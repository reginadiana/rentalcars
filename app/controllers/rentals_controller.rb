class RentalsController < ApplicationController

	#Garante que o usuario deve estar autenticado para acessar o index rentals
	before_action :authenticate_user!, only: [:index]
	
	def index
		@rentals = Rental.all
	end

	def new
		@rental = Rental.new
		@customers = Customer.all
		@car_categories = CarCategory.all
	end

	def create
		@rental = Rental.new(require_params)
		if @rental.save
			redirect_to rentals_path
		else
			@customers = Customer.all
			@car_categories = CarCategory.all	
			render :new
		end
	end

	private
	
	def require_params
		params.require(:rental).permit(:start_date, :end_date, :customer_id, :car_category_id)
	end

	def id
		params[:id]
	end
end
