Rails.application.routes.draw do
  devise_for :users
	root to: 'home#index'
	resources :car_categories
	resources :manufacturers
	resources :car_models
	 resources :customers do
    		get 'search', on: :collection
  	end

	resources :rentals do
		get 'search', on: :collection	
		resources :car_rentals, only: [:new, :create]
	end

	resources :subsidiaries
	resources :cars
end
