require 'rails_helper'

feature 'Admin deletes customers' do
	scenario 'successfully' do
		customer_a = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Clientes'
		find("a#delete-#{customer_a.id}").click()

		expect(current_path).to eq customers_path
		expect(page).to have_content('Nenhum cliente cadastrado')
	end

	scenario 'and keep anothers' do
		customer_a = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
		customer_b = Customer.create!(name: 'Sara', document: '452.176.388-00', email: 'sarinha@gmail.com')

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Clientes'
		find("a#delete-#{customer_a.id}").click()

		expect(current_path).to eq customers_path
		expect(page).not_to have_content('Lucas')
		expect(page).to have_content('Sara')
	end
end
