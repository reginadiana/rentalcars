require 'rails_helper'

feature 'User view customer' do
	scenario 'successfully' do
		Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
		Customer.create!(name: 'Sara', document: '452.176.388-00', email: 'sara@gmail.com')

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Clientes'

		expect(page).to have_content('Lucas')
		expect(page).to have_content('508.218.249.15')
		expect(page).to have_content('lucas@gmail.com')
		expect(page).to have_content('Sara')
		expect(page).to have_content('452.176.388-00')
		expect(page).to have_content('sara@gmail.com')
	end

	scenario 'and no custumers are created' do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Clientes'

		expect(page).to have_content('Nenhum cliente cadastrado')
	end

	scenario 'and return to home page' do

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Clientes'
		click_on 'Voltar'

		expect(current_path).to eq root_path
	end
end
