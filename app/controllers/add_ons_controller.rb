class AddOnsController < ApplicationController
	
	def index
		@add_ons = AddOn.all
	end

	def new
		@add_on = AddOn.new
	end
	def create
		@add_on = AddOn.new(require_params)
		if @add_on.save	
	    		redirect_to add_ons_path
	    	else 
			render :new
	    	end
	end

	def edit
		@add_on = AddOn.find(id)
	end

	def update
		@add_on = AddOn.find(id)
		if @add_on.update(require_params)
			redirect_to add_ons_path
		else
			render :edit
		end
	end

	def destroy
		@add_on = AddOn.find(id)
		@add_on.destroy

		redirect_to add_ons_path
	end

	private
	
	def require_params
		params.require(:add_on).permit(:name, :daily_rate)
	end

	def id
		params[:id]
	end
end
