require 'rails_helper'

feature 'User view rental' do
	scenario 'successfully' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		rental = Rental.create!(start_date: '22/03/1995', end_date: '22/03/2000', customer: customer, car_category: car_category)
		
		user = User.create!(email: 'joana@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Locações'

		expect(page).to have_content("22/03/1995")
		expect(page).to have_content("22/03/2000")
		expect(page).to have_content("#{customer.name}")
		expect(page).to have_content("#{car_category.name}")
	end

	scenario 'and no rentals are created' do
		user = User.create!(email: 'diana@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Locações'

		expect(page).to have_content('Nenhuma locação registrada')
	end

	scenario 'and return to home page' do

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Locações'
		click_on 'Voltar'

		expect(current_path).to eq root_path
	end
end
