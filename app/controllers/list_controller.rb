class ListController < ApplicationController
	def index
		@users = User.all
	end
end
