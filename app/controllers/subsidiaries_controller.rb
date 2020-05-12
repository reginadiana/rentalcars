class SubsidiariesController < ApplicationController

	before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy] 

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
	
	def authorize_admin
		redirect_to root_path, notice: 'Não autorizado' unless current_user.admin?
	end

	def authenticate_user
	    
	    if current_user.user?
	      redirect_to subsidiaries_path
	    end
	end
end

