require 'rails_helper'

feature 'User can not' do
	before :each do
		car = create(:car, license_plate: '2508ABC')
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user
	end

	scenario 'register valid car' do

		visit root_path
		click_on 'Carros das Frotas'

		expect(page).to have_content('2508ABC')
		expect(page).not_to have_link 'Registrar novo carro'
	end

	scenario 'edit car' do

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'

		expect(page).not_to have_link 'Editar'
	end
	scenario 'delete car' do

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'

		expect(page).not_to have_link 'Excluir'
	end
end

