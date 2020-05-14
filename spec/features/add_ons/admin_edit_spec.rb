require 'rails_helper'

feature 'Admin edits on' do

	before :each do
		user = create(:user)
		user.admin!
		login_as user, scope: :user
	end

	scenario 'successfully' do
		add_on = AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')

		visit root_path
		click_on 'Lista de Acessórios'
		find("a#edit-#{add_on.id}").click()

		fill_in 'Nome', with: 'Porta Copos'
		click_on 'Enviar'

		expect(page).to have_content('Porta Copos')
		expect(page).not_to have_content('Carrinho para pets')
	end

	scenario 'can not be blank' do

		add_on = AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')
		
		visit root_path
		click_on 'Lista de Acessórios'
		find("a#edit-#{add_on.id}").click()

		fill_in 'Nome', with: ''
		fill_in 'Diária', with: ''

		click_on 'Enviar'

		expect(page).to have_content('Nome não pode ficar em branco')
		expect(page).to have_content('Diária não pode ficar em branco')
	end

	scenario 'name must be unique' do
		add_on_a = AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')
		add_on_b = AddOn.create!(name: 'Porta Copos', daily_rate: '8.99')
	
		visit root_path
		click_on 'Lista de Acessórios'
		find("a#edit-#{add_on_a.id}").click()

		fill_in 'Nome', with: 'Porta Copos'

		click_on 'Enviar'

		expect(page).to have_content('Nome já está em uso')
	end

	scenario 'and return to ons list ' do

		add_on_a = AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')

		visit root_path
		click_on 'Lista de Acessórios'
		find("a#edit-#{add_on_a.id}").click()

		click_on 'Voltar'

		expect(current_path).to eq add_ons_path
	end
end
