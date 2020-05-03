require 'rails_helper'

feature 'Admin register rental' do
	scenario 'successfully' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')

		login_as user, scope: :user
		visit root_path
		click_on 'Locações'
		click_on 'Registrar nova locação'
		
		fill_in 'Data de inicio', with: '27/04/2030'
		fill_in 'Data de término', with: '27/04/2040'
		select customer.name, from: 'Cliente'
		select car_category.name, from: 'Categoria'

		click_on 'Enviar'

		expect(page).to have_content('Data de inicio: 27/04/2030')
		expect(page).to have_content('Data de término: 27/04/2040')
		expect(page).to have_content('Cliente: Diana')
		expect(page).to have_content('Categoria: A')
	end

	scenario 'and must fill in all fields' do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')

		login_as user, scope: :user

		visit root_path
		click_on 'Locações'
		click_on 'Registrar nova locação'

		fill_in 'Data de inicio', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Data de inicio não pode ficar em branco')
	end

	scenario 'and must be authenticated' do
		visit new_rental_path

		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')	
	end
end
