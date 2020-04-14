class ManufacturersController < ApplicationController
	def index
	    @manufacturers = Manufacturer.all
	end
	def show
	    @manufacturers = Manufacturer.find(params[:id])
	end
	def create
	    @manufacturers = Manufacturer.new(params.require(:manufacturer).permit(:name))
            @manufacturers.save
	    redirect_to @manufacturers
	end
	def new
	    @manufacturers = Manufacturer.new
	end
end  
