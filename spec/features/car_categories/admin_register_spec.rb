require 'rails_helper'

feature 'Admin register valid car category' do

	before :each do
		user = create(:user)
		user.admin!
		login_as user, scope: :user
	end

	scenario 'successfully' do
	
		visit root_path
		click_on 'Categorias de Carros'
		click_on 'Registrar nova Categoria'

		fill_in 'Nome', with: 'Z'
		fill_in 'Diária', with: '50'
		fill_in 'Seguro do Carro', with: '10'
		fill_in 'Seguro para Terceiros', with: '30'

		click_on 'Enviar'
	
		expect(page).to have_content('Categoria do Carro')
		expect(page).to have_content('Diária')
		expect(page).to have_content('Seguro do Carro')
		expect(page).to have_content('Seguro para Terceiros')

		expect(page).to have_content('Z')
		expect(page).to have_content('R$ 50,00')
		expect(page).to have_content('R$ 10,00')
		expect(page).to have_content('R$ 30,00')

		expect(page).to have_link 'Editar'
		expect(page).to have_link 'Excluir'
	end

	scenario 'and name must be unique' do
		car_category = create(:car_category, name: 'A')
	
		visit root_path
		click_on 'Categorias de Carros'
		click_on 'Registrar nova Categoria'

		fill_in 'Nome', with: 'A'

		click_on 'Enviar'
	
		expect(page).to have_content('Nome já está em uso')
	end

	scenario 'and name can not be blank' do

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'Registrar nova Categoria'

		fill_in 'Nome', with: ''
		fill_in 'Diária', with: ''
		fill_in 'Seguro do Carro', with: ''
		fill_in 'Seguro para Terceiros', with: ''
		click_on 'Enviar'

		expect(page).to have_content('Nome não pode ficar em branco')
		expect(page).to have_content('Diária não pode ficar em branco')
		expect(page).to have_content('Seguro do Carro não pode ficar em branco')
		expect(page).to have_content('Seguro para Terceiros não pode ficar em branco')
	end

	scenario 'and return to list car categories' do

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'Registrar nova Categoria'

		click_on 'Voltar'

		expect(current_path).to eq car_categories_path
	end
end

