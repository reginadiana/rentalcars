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

		within(".table") do
		      expect(page).to have_content("Código")
		end

		expect(page).to have_content("Data de inicio")
		expect(page).to have_content("Data de término")
		expect(page).to have_content("Cliente")
		expect(page).to have_content("Categoria")
	
		expect(page).to have_content("#{rental.code}")
		expect(page).to have_content("22/03/1995")
		expect(page).to have_content("22/03/2000")
		expect(page).to have_content("#{customer.name}")
		expect(page).to have_content("#{car_category.name}")

		expect(page).to have_link "edit-#{rental.id}" 
		expect(page).to have_link "delete-#{rental.id}"
	end

	scenario 'and must fill in all fields' do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')

		login_as user, scope: :user

		visit root_path
		click_on 'Locações'
		click_on 'Registrar nova locação'

		fill_in 'Data de inicio', with: ''
		fill_in 'Data de término', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Data de inicio não pode ficar em branco')
		expect(page).to have_content('Data de término não pode ficar em branco')
	end
end
