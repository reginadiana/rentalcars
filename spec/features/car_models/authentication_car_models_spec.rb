require 'rails_helper'

feature 'Visitor tries to acess car models and' do
  	scenario 'cannot view index unless logged in' do
    		visit root_path

    		expect(page).not_to have_link('Modelos de Carros')
  	end

  	scenario 'cannot view car model index unless logged in' do
		visit car_models_path

		expect(current_path).to eq(new_user_session_path)
    		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  	end

  	scenario 'and must be authenticated to see detals' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		visit car_model_path(car_model)

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
	scenario 'and must be authenticated to create a new model' do

		visit new_car_model_path

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
  	scenario 'and must be authenticated to edit some model' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

    		visit edit_car_model_path(car_model)

    		expect(current_path).to eq(new_user_session_path)	
    		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
end
