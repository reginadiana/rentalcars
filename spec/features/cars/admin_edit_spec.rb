require 'rails_helper'

feature 'Admin edits car' do

	before :each do
		user = create(:user)
		user.admin!

		login_as user, scope: :user
	end

	scenario 'successfully' do
		car = create(:car, license_plate: '2508ABC')

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'
		fill_in 'Placa', with: '252525'
		click_on 'Enviar'

		expect(page).to have_content('252525')
	end

	scenario 'can not be blank' do
		car = create(:car, license_plate: '2508ABC')

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'

		fill_in 'Placa', with: ''
		fill_in 'Cor', with: ''
		fill_in 'Quilometragem', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Placa não pode ficar em branco')
		expect(page).to have_content('Cor não pode ficar em branco')
		expect(page).to have_content('Quilometragem não pode ficar em branco')
	end

	scenario 'must be unique' do
		car_a = create(:car, license_plate: '2508ABC')
		car_b = create(:car, license_plate: 'AAAAAA')

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'
		
		fill_in 'Placa', with: 'AAAAAA'

		click_on 'Enviar'

		expect(page).to have_content('Placa já está em uso')
	end

	scenario 'and return to list car categories' do
		car = create(:car, license_plate: '2508ABC')

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Editar'

		click_on 'Voltar'

		expect(current_path).to eq cars_path
	end
end
