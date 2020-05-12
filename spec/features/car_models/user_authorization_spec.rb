require 'rails_helper'

feature 'User can not' do
	before :each do
		@car_model = create(:car_model, name: 'Fiat')
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user
	end

	scenario 'to create some car model by route' do
		visit new_car_model_path
		expect(current_path).to eq(car_models_path)
	end

	scenario 'to edit some car model by route' do
		visit edit_car_model_path(@car_model)
		expect(current_path).to eq(car_models_path)
	end

	scenario 'register valid car model' do

		visit root_path
		click_on 'Modelos de Carros'

		expect(page).to have_content("Fiat")
		expect(page).not_to have_link 'Registrar novo modelo'
	end

	scenario 'edit car model' do

		visit root_path
		click_on 'Modelos de Carros'
		find("a#details-#{@car_model.id}").click()

		expect(page).not_to have_link "edit-#{@car_model.id}" 
	end
	scenario 'delete car model' do

		visit root_path
		click_on 'Modelos de Carros'
		find("a#details-#{@car_model.id}").click()

		expect(page).not_to have_link "delete-#{@car_model.id}"
	end
end
