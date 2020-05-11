require 'rails_helper'

feature 'Admin deletes car categories' do
	scenario 'successfully' do
		CarCategory.create(name: 'D', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'D'
		click_on 'Excluir'

		expect(current_path).to eq car_categories_path
		expect(page).to have_content('Nenhuma categoria cadastrada')
	end

	scenario 'and keep anothers' do
		CarCategory.create(name: 'D', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)
		CarCategory.create(name: 'E', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'D'
		click_on 'Excluir'

		expect(current_path).to eq car_categories_path

		within(".colums") do
		      	expect(page).not_to have_content('D')
			expect(page).to have_content('E')
		end
	end
end
