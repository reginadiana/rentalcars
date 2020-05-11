require 'rails_helper'

feature 'Admin edits car models' do
	scenario 'successfully' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Modelos de Carros'
		find("a#details-#{car_model.id}").click()

		click_on 'Editar'
		fill_in 'Nome', with: 'Carro Simples'
		click_on 'Enviar'

		expect(page).to have_content('Carro Simples')
	end

	scenario 'and cannot be black' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)
    
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Modelos de Carros'
		find("a#details-#{car_model.id}").click()

		click_on 'Editar'
		fill_in 'Nome', with: ''
		click_on 'Enviar'

		expect(page).to have_content('Nome não pode ficar em branco')
	end
end
