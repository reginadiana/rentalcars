require 'rails_helper'

feature 'User start rental' do
	scenario 'successfully by search' do
		manufacturer = create(:manufacturer)
		car_category = create(:car_category)
		car_model = create(:car_model, manufacturer: manufacturer, car_category: car_category)

	    	car = create(:car, license_plate: 'ABC1234', car_model: car_model)
	    	customer = create(:customer, name: 'Fulano Sicrano', 
		                         email: 'teste@teste.com.br')

	    	rental = create(:rental, customer: customer, 
		                     car_category: car_model.car_category)

	    	user = create(:user, email: 'test@test.com.br')

		login_as user, scope: :user
		visit search_rentals_path(q: rental.code)
		click_on 'Iniciar'

		expect(page).to have_link 'Voltar'
		select car.license_plate, from: 'Carro'
		click_on 'Confirmar locação'

		expect(page).to have_content(I18n.l(Time.zone.now, format: :long))
		expect(page).to have_content(car.license_plate)
		expect(page).to have_content(customer.name)
		expect(page).to have_content(customer.email)
		expect(page).to have_content('Em progresso')
		expect(page).to have_content(user.email)
	end
end 
