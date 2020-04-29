Rails.application.routes.draw do
	root to: 'home#index'
	resources :car_categories
	resources :manufacturers
	resources :car_models
	resources :customers, only: [:new, :create, :edit, :update]
	resources :rentals, only: [:index, :new, :create]
end
