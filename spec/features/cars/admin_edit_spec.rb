require 'rails_helper'

feature 'Admin edits car' do
	scenario 'successfully' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Car.create!(license_plate: '2508ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'
		fill_in 'Placa', with: '252525'
		click_on 'Enviar'

		expect(page).to have_content('252525')
	end

	scenario 'can not be blank' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Car.create!(license_plate: '2508ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'

		fill_in 'Placa', with: ''
		fill_in 'Cor', with: ''
		fill_in 'Quilometragem', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Placa não pode ficar em branco')
		expect(page).to have_content('Cor não pode ficar em branco')
		expect(page).to have_content('Quilometragem não pode ficar em branco')
	end

	scenario 'must be unique' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Car.create!(license_plate: '2508ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

		Car.create!(license_plate: 'AAAAAA', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'
		
		fill_in 'Placa', with: 'AAAAAA'

		click_on 'Enviar'

		expect(page).to have_content('Placa já está em uso')
	end

	scenario 'and return to list car categories' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Car.create!(license_plate: '2508ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'

		click_on 'Voltar'

		expect(current_path).to eq cars_path
	end
end
