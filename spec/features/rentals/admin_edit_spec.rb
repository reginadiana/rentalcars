require 'rails_helper'

feature 'Admin edits rental' do

	before :each do
		user = create(:user)

		login_as user, scope: :user
	end

	scenario 'successfully' do
		customer = create(:customer)
		car_category = create(:car_category)
		rental = Rental.create!(start_date: '22/03/1995', end_date: '22/03/2000', customer: customer, car_category: car_category)

		visit root_path
		click_on 'Locações'
		find("a#edit-#{rental.id}").click()

		fill_in 'Data de inicio', with: '27/04/2030'
		click_on 'Enviar'

		expect(page).to have_content('27/04/2030')
	end

	scenario 'can not be blank' do
		rental = create(:rental)

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
