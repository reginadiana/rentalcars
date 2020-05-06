require 'rails_helper'

feature 'Admin deletes cars' do
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

		click_on 'Excluir'

		expect(current_path).to eq cars_path
		expect(page).to have_content('Nenhum carro cadastrado')
	end

	scenario 'and keep anothers' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Car.create!(license_plate: '2508ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

		Car.create!(license_plate: 'XUXUXU', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)


		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Excluir'

		expect(current_path).to eq cars_path
		expect(page).not_to have_content('2508ABC')
		expect(page).to have_content('XUXUXU')
	end
end
