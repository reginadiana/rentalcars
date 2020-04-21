class ManufacturersController < ApplicationController
	def index
	    	@manufacturers = Manufacturer.all
	end
	def show
	    	@manufacturer = Manufacturer.find(params[:id])
	end
	def create
		@manufacturer = Manufacturer.new(params.require(:manufacturer).permit(:name))
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
		@manufacturer = Manufacturer.find(params[:id])
	end

	def update
		@manufacturer = Manufacturer.find(params[:id])
		if @manufacturer.update(params.require(:manufacturer).permit(:name))
			redirect_to @manufacturer
		else
			render :edit
		end
	end
end  
