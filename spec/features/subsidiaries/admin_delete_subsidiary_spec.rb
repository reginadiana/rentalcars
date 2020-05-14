require 'rails_helper'

feature 'Admin deletes subsidiary' do

	scenario 'successfully' do

		user = create(:user)
		user.admin!

		login_as user, scope: :user

		Subsidiary.create!(name: 'Pumbas', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')

		visit root_path
		click_on 'Filiais'
		click_on 'Pumbas'
		click_on 'Excluir'

		expect(current_path).to eq subsidiaries_path
		expect(page).not_to have_content('Pumbas')
	end

	scenario 'and keep anothers' do

		user = create(:user)
		user.admin!

		login_as user, scope: :user

		Subsidiary.create!(name: 'ACCENT', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Subsidiary.create!(name: 'ACCIONA', cnpj: '85.171.517/0001-04', address: 'Rua: Masp')

		visit root_path
		click_on 'Filiais'
		click_on 'ACCIONA'
		click_on 'Excluir'

		expect(current_path).to eq subsidiaries_path
		expect(page).not_to have_content('ACCIONA')
		expect(page).to have_content('ACCENT')
		expect(page).to have_content(user.subsidiary.name)
	end
end
