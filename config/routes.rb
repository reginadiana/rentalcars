Rails.application.routes.draw do
	root to: 'home#index'
	resources :car_categories, only: [:index, :show, :new, :create, :edit, :update]
	resources :manufacturers
	resources :car_models, only: [:index, :show]
	resources :customers, only: [:new, :create, :edit, :update]
end
