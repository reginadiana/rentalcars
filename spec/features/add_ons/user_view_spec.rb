require 'rails_helper'

feature 'User view ons' do

	before :each do
		user = create(:user)
		login_as user, scope: :user
	end

	scenario 'successfully' do
		on_a = AddOn.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
		on_b = AddOn.create!(name: 'Sara', document: '452.176.388-00', email: 'sara@gmail.com')

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

	scenario 'and no ons are created' do

		visit root_path
		click_on 'Lista de Acessórios'

		expect(page).to have_content('Nenhum acessório cadastrado')
	end

	scenario 'and return to home page' do

		visit root_path
		click_on 'Lista de Acessórios'
		click_on 'Voltar'

		expect(current_path).to eq root_path
	end
end
