Rails.application.routes.draw do
	root to: 'home#index'
	resources :car_categories, only: [:index, :show, :new, :create]
	resources :manufacturers
	resources :car_models, only: [:index, :show]
end
