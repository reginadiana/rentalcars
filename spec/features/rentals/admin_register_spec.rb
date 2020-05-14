require 'rails_helper'

feature 'Admin register rental' do

	before :each do
		user = create(:user)

		login_as user, scope: :user
	end

	scenario 'successfully' do
		customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)

		visit root_path
		click_on 'Locações'
		click_on 'Registrar nova locação'
		
		fill_in 'Data de inicio', with: '22/03/1995'
		fill_in 'Data de término', with: '22/03/2000'
		select customer.name, from: 'Cliente'
		select car_category.name, from: 'Categoria'
		expect(RentalsMailer).to receive(:scheduled).and_call_original
		click_on 'Enviar'

		within(".table") do
		      expect(page).to have_content("Código")
		end

		expect(page).to have_content("Data de inicio")
		expect(page).to have_content("Data de término")
		expect(page).to have_content("Cliente")
		expect(page).to have_content("Categoria")
	
		expect(page).to have_content("22/03/1995")
		expect(page).to have_content("22/03/2000")
		expect(page).to have_content("#{customer.name}")
		expect(page).to have_content("#{car_category.name}")
	end

	scenario 'and must fill in all fields' do

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
