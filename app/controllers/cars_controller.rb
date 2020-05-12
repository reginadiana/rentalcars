class CarsController < ApplicationController

	before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy] 

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
		params.require(:car).permit(:license_plate, :color, :car_model_id, :mileage, :subsidiary_id, :car_photo)
	end

	def id
		params[:id]
	end

	def authenticate_user
	    
	    if current_user.user?
	      redirect_to cars_path
	    end
	end
end
