require 'rails_helper'

feature 'Admin register valid manufacturer' do
	scenario 'and name must be unique' do
		Manufacturer.create!(name: 'Fiat' )

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		user.admin!

		login_as user, scope: :user

		visit root_path
		click_on 'Fabricantes'
		click_on 'Registrar novo fabricante'

		fill_in 'Nome', with: 'Fiat'
		click_on 'Enviar'

		expect(page).to have_content('Nome já está em uso')
	end

	scenario 'and name can not be blank' do

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		user.admin!
		login_as user, scope: :user

		visit root_path
		click_on 'Fabricantes'
		click_on 'Registrar novo fabricante'

		fill_in 'Nome', with: ''
		click_on 'Enviar'

		expect(page).to have_content('Nome não pode ficar em branco')
	end

	scenario 'and return to list manufacturers' do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		user.admin!
		login_as user, scope: :user

		visit root_path
		click_on 'Fabricantes'
		click_on 'Registrar novo fabricante'
		click_on 'Voltar'

		expect(current_path).to eq manufacturers_path
	end
end

