require 'rails_helper'

feature 'Admin edits car category' do

	before :each do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		user.admin!
		login_as user, scope: :user
	end

	scenario 'successfully' do

		car_category = create(:car_category, name: 'A')

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'A'
		click_on 'Editar'
		fill_in 'Nome', with: 'B'
		click_on 'Enviar'

		expect(page).to have_content('B')
	end

	scenario 'can not be blank' do
		car_category = create(:car_category, name: 'A')

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'A'
		click_on 'Editar'

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

	scenario 'must be unique' do
		CarCategory.create(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)
		CarCategory.create(name: 'B', daily_rate: 40, car_insurance: 60, third_part_insurance: 10)

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'A'
		click_on 'Editar'
		
		fill_in 'Nome', with: 'B'

		click_on 'Enviar'

		expect(page).to have_content('Nome já está em uso')
	end

	scenario 'and return to list car categories' do
		car_category = create(:car_category, name: 'C')

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'C'
		click_on 'Editar'

		click_on 'Voltar'

		expect(current_path).to eq car_categories_path
	end
end
