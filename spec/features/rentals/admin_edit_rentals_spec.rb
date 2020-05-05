require 'rails_helper'

feature 'Admin edits rental' do
	scenario 'successfully' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		rental = Rental.create!(start_date: '22/03/1995', end_date: '22/03/2000', customer: customer, car_category: car_category)
		user = User.create!(email: 'joana@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Locações'
		find("a#edit-#{rental.id}").click()

		fill_in 'Data de inicio', with: '27/04/2030'
		click_on 'Enviar'

		expect(page).to have_content('27/04/2030')
	end

	scenario 'can not be blank' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		rental = Rental.create!(start_date: '22/03/1995', end_date: '22/03/2000', customer: customer, car_category: car_category)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Locações'
		find("a#edit-#{rental.id}").click()

		fill_in 'Data de inicio', with: ''
		fill_in 'Data de término', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Data de inicio não pode ficar em branco')
		expect(page).to have_content('Data de término não pode ficar em branco')
	end
end
