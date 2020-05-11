require 'rails_helper'

feature 'User view rental' do
	before :each do
		user = User.create!(email: 'joana@teste.com.br', password: '12345678')
		login_as user, scope: :user
	end
	scenario 'successfully' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
		rental = Rental.create!(start_date: '22/03/1995', end_date: '22/03/2000', customer: customer, car_category: car_category)

		visit root_path
		click_on 'Locações'

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

		#expect(page).to have_link "edit-#{rental.id}" 
		#expect(page).to have_link "delete-#{rental.id}"
	end

	scenario 'and no rentals are created' do

		visit root_path
		click_on 'Locações'

		expect(page).to have_content('Nenhuma locação registrada')
	end

	scenario 'and return to home page' do

		visit root_path
		click_on 'Locações'
		click_on 'Voltar'

		expect(current_path).to eq root_path
	end
end
