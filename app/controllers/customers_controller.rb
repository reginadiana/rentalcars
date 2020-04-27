class CustomersController < ApplicationController
	def new
		@customer = Customer.new
	end
	def create
		@customer = Customer.new(require_params)
		if @customer.save	
	    		redirect_to root_path
	    	else 
			render :new
	    	end
	end

	private
	
	def require_params
		params.require(:customer).permit(:name, :document, :email)
	end

	def id
		params[:id]
	end
end
