require 'rails_helper'

feature 'Admin deletes manufacturer' do

	before :each do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		user.admin!

		login_as user, scope: :user
	end

	scenario 'successfully' do
		Manufacturer.create!(name: 'Fiat')

		visit root_path
		click_on 'Fabricantes'
		click_on 'Fiat'
		click_on 'Excluir'

		expect(current_path).to eq manufacturers_path
		expect(page).to have_content('Nenhum fabricante cadastrado')
	end

	scenario 'and keep anothers' do
		Manufacturer.create!(name: 'Fiat')
		Manufacturer.create!(name: 'Honda')

		visit root_path
		click_on 'Fabricantes'
		click_on 'Fiat'
		click_on 'Excluir'

		expect(current_path).to eq manufacturers_path
		expect(page).not_to have_content('Fiat')
		expect(page).to have_content('Honda')
	end
end
