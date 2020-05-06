require 'rails_helper'

feature 'Admin register car models' do
	scenario 'successfully' do
		
		manufacturer = Manufacturer.create!(name: 'Fiat')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    		login_as user, scope: :user

		visit root_path
		click_on 'Modelos de Carros'
		click_on 'Registrar novo modelo de carro'
		fill_in 'Nome', with: 'Uno'
		fill_in 'Ano', with: '2020'
		fill_in 'Motor', with: '1.0'
		fill_in 'Combustivel', with: 'Flex'

		select 'Fiat', from: 'Fabricante'
		select 'A', from: 'Categoria do Carro'	
		click_on 'Enviar'

		expect(page).to have_content('Uno')
		expect(page).to have_content('Fiat')
		expect(page).to have_content('2020')
		expect(page).to have_content('1.0')
		expect(page).to have_content('R$ 100,00')
		expect(page).to have_content(/A/)
	end

	scenario 'and fill in all fields' do
                user = User.create!(email: 'teste@teste.com.br', password: '12345678')
                login_as user, scope: :user

		visit new_car_model_path
		fill_in 'Ano', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Nome não pode ficar em branco')
		expect(page).to have_content('Ano não pode ficar em branco')
		expect(page).to have_content('Motor não pode ficar em branco')
		expect(page).to have_content('Combustivel não pode ficar em branco')
	end

	scenario 'and return to list car models' do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Modelos de Carros'
		click_on 'Registrar novo modelo de carro'
		click_on 'Voltar'

		expect(current_path).to eq car_models_path
	end
end
