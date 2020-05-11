require 'rails_helper'

feature 'Admin search rental' do
	scenario 'successfully' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')

		rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

		another_rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

		login_as user, scope: :user
		visit root_path
		click_on 'Locações'
		fill_in 'Código', with: rental.code
		click_on 'Buscar'
		
		expect(page).to have_link 'Voltar'
		expect(page).to have_content(rental.code)
		expect(page).not_to have_content(another_rental.code)
	end

	scenario 'and cannot be black' do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')

		login_as user, scope: :user
		visit root_path
		click_on 'Locações'
		fill_in 'Código', with: ''
		click_on 'Buscar'
		
		expect(page).to have_link 'Voltar'
		expect(page).to have_content('Nenhum resultado encontrado para:')
	end

	scenario 'and code cannot be found' do

		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')

		rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

		another_rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

		login_as user, scope: :user
		visit root_path
		click_on 'Locações'
		fill_in 'Código', with: 'ABXUXA'
		click_on 'Buscar'
		
		expect(page).to have_link 'Voltar'
		expect(page).not_to have_content(rental.code)
		expect(page).not_to have_content(another_rental.code)

		expect(page).to have_content('Nenhum resultado encontrado para: ABXUXA')
	end
end
