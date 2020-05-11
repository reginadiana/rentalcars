require 'rails_helper'

feature 'Admin deletes subsidiary' do

	before :each do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		user.admin!

		login_as user, scope: :user
	end

	scenario 'successfully' do
		Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')

		visit root_path
		click_on 'Filiais'
		click_on 'ACCENTURE'
		click_on 'Excluir'

		expect(current_path).to eq subsidiaries_path
		expect(page).to have_content('Nenhuma filial cadastrada')
	end

	scenario 'and keep anothers' do
		Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Subsidiary.create!(name: 'ACCIONA', cnpj: '85.171.517/0001-04', address: 'Rua: Masp')

		visit root_path
		click_on 'Filiais'
		click_on 'ACCENTURE'
		click_on 'Excluir'

		expect(current_path).to eq subsidiaries_path
		expect(page).not_to have_content('ACCENTURE')
		expect(page).to have_content('ACCIONA')
	end
end
