require 'rails_helper'

feature 'Visitor tries to acess cars and' do
	scenario 'cannot view index unless logged in' do
		visit root_path

		expect(page).not_to have_link('Carros das Frotas')
	end

	scenario 'cannot view car index unless logged in' do
		visit cars_path

		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
	end
        scenario 'and must be authenticated to see detals' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
						motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')

		car = Car.create!(license_plate: '0000AAA', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

		visit car_path(car)

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
  	scenario 'and must be authenticated to create a new car' do

    		visit new_car_path

    		expect(current_path).to eq(new_user_session_path)	
    		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
        scenario 'and must be authenticated to edit some car' do
		
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
						motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')

		car = Car.create!(license_plate: '0000AAA', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

		visit edit_car_path(car)

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
end
