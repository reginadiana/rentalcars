Rails.application.routes.draw do
  devise_for :users
	root to: 'home#index'
	resources :car_categories
	resources :manufacturers
	resources :car_models
	resources :customers
	resources :rentals
	resources :subsidiaries
	resources :cars
end
