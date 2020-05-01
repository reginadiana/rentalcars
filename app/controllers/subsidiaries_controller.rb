class SubsidiariesController < ApplicationController
	def index
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

        private
	
	def require_params
		params.require(:subsidiary).permit(:name, :cnpj, :address)
	end

	def id
		params[:id]
	end
end

