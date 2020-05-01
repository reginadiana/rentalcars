require 'rails_helper'

feature 'Admin view subsidiaries' do
	scenario 'successfully' do
		Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		Subsidiary.create!(name: 'ACCIONA', cnpj: '98.168.496/0001-74', address: 'Rua: Masp')
		

		visit root_path
		click_on 'Filiais'
		
		expect(page).to have_content 'ACCENTURE'
		expect(page).to have_content 'ACCIONA'
	end

	scenario 'and return to home page' do

	    visit root_path
	    click_on 'Filiais'
	    click_on 'Voltar'

	    expect(current_path).to eq root_path
	end

	scenario 'view subsidiary details' do
		Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')
		
		visit root_path
		click_on 'Filiais'
		click_on 'ACCENTURE'

		expect(page).to have_content 'ACCENTURE'
		expect(page).to have_content '99.168.496/0001-74'
		expect(page).to have_content 'Rua: Paulista'	
	end	
	

	scenario 'empty list' do
	    visit root_path
	    click_on 'Filiais'

	    expect(page).to have_content('Nenhuma filial cadastrada')
	end
end
