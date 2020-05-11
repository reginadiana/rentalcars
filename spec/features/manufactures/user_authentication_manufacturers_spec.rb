require 'rails_helper'

feature 'User can not' do
	scenario 'register valid manufacturer' do
		Manufacturer.create!(name: 'Fiat' )

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Fabricantes'

		expect(page).to have_content('Fiat')
		expect(page).not_to have_link 'Registrar novo fabricante'
	end

	scenario 'edit manufacturer' do
		Manufacturer.create!(name: 'Fiat' )

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Fabricantes'
		click_on 'Fiat'

		expect(page).not_to have_link 'Editar'
	end
	scenario 'delete manufacturer' do
		Manufacturer.create!(name: 'Fiat' )

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Fabricantes'
		click_on 'Fiat'

		expect(page).not_to have_link 'Excluir'
	end
end

