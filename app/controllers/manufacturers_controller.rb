class ManufacturersController < ApplicationController

	def index
	    	@manufacturers = Manufacturer.all
		@user = current_user
	end
	def show
	    	@manufacturer = Manufacturer.find(id)
	end
	def create
		@manufacturer = Manufacturer.new(require_params)
            	if @manufacturer.save
			flash[:notice] = 'Fabricante criado com sucesso'	
	    		redirect_to @manufacturer
	    	else 
			render :new
	    	end
	end
	def new
		@manufacturer = Manufacturer.new
	end

	def edit
		@manufacturer = Manufacturer.find(id)
	end

	def update
		@manufacturer = Manufacturer.find(id)
		if @manufacturer.update(require_params)
			redirect_to @manufacturer
		else
			render :edit
		end
	end

	def destroy
		@manufacturer = Manufacturer.find(id)
		@manufacturer.destroy

		redirect_to manufacturers_path
	end

	private
	
	def require_params
		params.require(:manufacturer).permit(:name)
	end

	def id
		params[:id]
	end
end  
