require 'rails_helper'

feature 'User view customer' do
	scenario 'successfully' do
		customer_a = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
		customer_b = Customer.create!(name: 'Sara', document: '452.176.388-00', email: 'sara@gmail.com')

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Clientes'

		expect(page).to have_content('Cliente')
		expect(page).to have_content('Email')
		expect(page).to have_content('CPF')

		expect(page).to have_content('Lucas')
		expect(page).to have_content('508.218.249.15')
		expect(page).to have_content('lucas@gmail.com')
		expect(page).to have_content('Sara')
		expect(page).to have_content('452.176.388-00')
		expect(page).to have_content('sara@gmail.com')

		expect(page).to have_link "edit-#{customer_a.id}" 
		expect(page).to have_link "delete-#{customer_a.id}"

		expect(page).to have_link "edit-#{customer_b.id}" 
		expect(page).to have_link "delete-#{customer_b.id}"
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
