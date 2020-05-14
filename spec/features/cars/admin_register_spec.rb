require 'rails_helper'

feature 'Admin register valid car' do

	before :each do
		user = create(:user)
		user.admin!

		login_as user, scope: :user
	end

	scenario 'successfully' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)
		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')

		visit root_path
		click_on 'Carros das Frotas'
		click_on 'Registrar novo carro'

		fill_in 'Placa', with: '0000AAA'
		fill_in 'Cor', with: 'Black'
		select 'Uno', from: 'Modelo de Carro'	
		fill_in 'Quilometragem', with: '1'
		select 'ACCENTURE', from: 'Filial'

		click_on 'Enviar'

		expect(page).to have_content('Placa')
		expect(page).to have_content('Cor')
		expect(page).to have_content('Modelo de Carro')
		expect(page).to have_content('Quilometragem')
		expect(page).to have_content('Filial')

		expect(page).to have_content('0000AAA')
		expect(page).to have_content('Black')
		expect(page).to have_content('Uno')
		expect(page).to have_content('1')
		expect(page).to have_content('ACCENTURE')

		expect(page).to have_link "Editar"
		expect(page).to have_link "Excluir"

	end
	scenario 'and license_plate must be unique' do
		car = create(:car, license_plate: '0000AAA')

		visit root_path
		click_on 'Carros das Frotas'
		click_on 'Registrar novo carro'

		fill_in 'Placa', with: '0000AAA'
		click_on 'Enviar'

		expect(page).to have_content('Placa já está em uso')
	end

	scenario 'lenght of mileage must be bigger then 0' do

		visit root_path
		click_on 'Carros das Frotas'
		click_on 'Registrar novo carro'

		fill_in 'Quilometragem', with: '-34'
		click_on 'Enviar'

		expect(page).to have_content('Quilometragem deve ser maior que 0')
	end

	scenario 'and license_plate can not be blank' do

		visit root_path
		click_on 'Carros das Frotas'
		click_on 'Registrar novo carro'

		fill_in 'Placa', with: ''
		click_on 'Enviar'

		expect(page).to have_content('Placa não pode ficar em branco')
	end

	scenario 'and return to list cars' do

		visit root_path
		click_on 'Carros das Frotas'
		click_on 'Registrar novo carro'
		click_on 'Voltar'

		expect(current_path).to eq cars_path
	end
end

