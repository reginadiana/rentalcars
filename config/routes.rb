Rails.application.routes.draw do
  devise_for :users
	root to: 'home#index'
	resources :car_categories
	resources :manufacturers
	resources :car_models
	resources :customers, only: [:new, :create, :edit, :update]
	resources :rentals, only: [:index, :new, :create]
	resources :subsidiaries, only: [:index, :show, :new, :create, :edit, :update]
	resources :cars, only: [:index, :show, :new, :create]
end
