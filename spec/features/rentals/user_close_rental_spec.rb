require 'rails_helper'

feature 'User close a rental' do

	xscenario 'successfully' do
		customer = create(:customer)
		car = create(:car)
		car.available!
		add_on = create(:add_on)
	    	rental = create(:rental, customer: customer)

	    	user = create(:user)
		login_as user, scope: :user

		visit customer_path(customer)
		click_on 'Iniciar'
		select car.license_plate, from: 'Carro'
		select add_on.name, from: 'Acessório'

		click_on 'Confirmar locação'

		visit root_path
		click_on 'Clientes'

		within "tr#customer-#{customer.id}" do
			click_on 'Locações'
		end

		within "tr#rental-#{rental.code}" do
			click_on 'Encerrar'
		end

		expect(page).to have_content('Locação encerrada')
		expect(page).not_to have_content('Em progresso')

	end

	xscenario 'and car turn a available' do
		customer = create(:customer)
		add_on = create(:add_on)
		car = create(:car, license_plate: 'ABC1234')
		car.available!

	    	rental = create(:rental, customer: customer)

	    	user = create(:user)
		login_as user, scope: :user

		visit customer_path(customer)
		click_on 'Iniciar'
		select car.license_plate, from: 'Carro'
		select add_on.name, from: 'Acessório'

		click_on 'Confirmar locação'

		visit root_path
		click_on 'Clientes'

		within "tr#customer-#{customer.id}" do
			click_on 'Locações'
		end

		within "tr#rental-#{rental.code}" do
			click_on 'Encerrar'
		end

		visit car_path(car)
		expect(page).to have_content('Disponível')
	end
end 
