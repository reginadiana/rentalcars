class SubsidiariesController < ApplicationController

	def index
		@subsidiaries = Subsidiary.all
	end
	def show
		@subsidiary = Subsidiary.find(id)
	end
	def new
		@subsidiary = Subsidiary.new 
	end

        def create
		@subsidiary = Subsidiary.new(require_params)
            	if @subsidiary.save
			flash[:notice] = 'Filial criada com sucesso'	
	    		redirect_to @subsidiary
	    	else 
			render :new
	    	end
	end

	def edit
		@subsidiary = Subsidiary.find(id)
	end

	def update
		@subsidiary = Subsidiary.find(id)
		if @subsidiary.update(require_params)
			redirect_to @subsidiary
		else
			render :edit
		end
	end

	def destroy
		@subsidiary = Subsidiary.find(id)
		@subsidiary.destroy

		redirect_to subsidiaries_path
	end	

        private
	
	def require_params
		params.require(:subsidiary).permit(:name, :cnpj, :address)
	end

	def id
		params[:id]
	end
end

