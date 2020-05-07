class RentalsController < ApplicationController
	
	def index
		@rentals = Rental.all
	end
	
	def show
		@rental = Rental.find(id)
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
	def search
		@q = params[:q]
		@rental = Rental.find_by(code: @q.upcase)
	end

	def edit
		@rental = Rental.find(id)
		@customers = Customer.all
		@car_categories = CarCategory.all
	end

	def update
		@rental = Rental.find(id)
		if @rental.update(require_params)
			redirect_to rentals_path
		else
			@customers = Customer.all
			@car_categories = CarCategory.all
			render :edit
		end
	end

	def destroy
		@rental = Rental.find(id)
		@rental.destroy

		redirect_to rentals_path
	end

	private
	
	def require_params
		params.require(:rental).permit(:start_date, :end_date, :customer_id, :car_category_id)
	end

	def id
		params[:id]
	end
end
