require 'rails_helper'

feature 'Admin register valid on' do

	before :each do
		user = create(:user)
		user.admin!
		login_as user, scope: :user
	end

	scenario 'successfully' do

		visit root_path
		click_on 'Lista de Acessórios'
		click_on 'Cadastrar Acessório'
	
		fill_in 'Nome', with: 'Carrinho para pets'
		fill_in 'Diária', with: '8.99'

		click_on 'Enviar'

		expect(page).to have_content('Acessório')
		expect(page).to have_content('Diária')

		expect(page).to have_content('Carrinho para pets')
		expect(page).to have_content('R$ 8,99')
	end

	scenario 'and name must be unique' do
		AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')

		visit root_path
		click_on 'Lista de Acessórios'
		click_on 'Cadastrar Acessório'
	
		fill_in 'Nome', with: 'Carrinho para pets'
		fill_in 'Diária', with: '10.00'

		click_on 'Enviar'

		expect(page).to have_content('Nome já está em uso')
	end

	scenario 'and daily_rate must be greater than 0' do

		visit root_path
		click_on 'Lista de Acessórios'
		click_on 'Cadastrar Acessório'
	
		fill_in 'Nome', with: 'Carrinho para pets'
		fill_in 'Diária', with: '-3.60'

		click_on 'Enviar'

		expect(page).to have_content('Diária deve ser maior que 0')
	end

	scenario 'and name and daily_rate can not be blank' do
		visit root_path
		click_on 'Lista de Acessórios'
		click_on 'Cadastrar Acessório'

		fill_in 'Nome', with: ''
		fill_in 'Diária', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Nome não pode ficar em branco')
		expect(page).to have_content('Diária não pode ficar em branco')
	end
end

