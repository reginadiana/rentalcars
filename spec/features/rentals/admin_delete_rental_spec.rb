require 'rails_helper'

feature 'Admin deletes rental' do
	scenario 'successfully' do
  		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		rental = Rental.create!(start_date: '22/03/1995', end_date: '22/03/2000', customer: customer, car_category: car_category)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Locações'
		find("a#delete-#{rental.id}").click()

		expect(current_path).to eq rentals_path
		expect(page).to have_content('Nenhuma locação registrada')
	end

	scenario 'and keep anothers' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		rental_a = Rental.create!(start_date: '22/03/1995', end_date: '22/03/2000', customer: customer, car_category: car_category)

		customer = Customer.create!(name: 'Vitor', document: '824.124.363-47', email: 'vitor@gmail.com')
		car_category = CarCategory.create!(name: 'F', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		rental_b = Rental.create!(start_date: '22/03/2002', end_date: '22/03/2004', customer: customer, car_category: car_category)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Locações'
		find("a#delete-#{rental_a.id}").click()

		expect(current_path).to eq rentals_path
		expect(page).not_to have_content('Diana')
		expect(page).to have_content('Vitor')
	end
end
