require 'rails_helper'

feature 'User can not' do
	scenario 'register valid manufacturer' do
		Manufacturer.create!(name: 'Fiat' )

		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user

		visit root_path
		click_on 'Fabricantes'

		expect(page).to have_content('Fiat')
		expect(page).not_to have_link 'Registrar novo fabricante'
	end

  	scenario 'and must be admin to create a new manufacturer' do

    		visit new_manufacturer_path

    		expect(current_path).to eq(new_user_session_path)	
    		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
        scenario 'and must be admin to edit some manufacturer' do
		manufacturer = Manufacturer.create!(name: 'Fiat')

		visit edit_manufacturer_path(manufacturer)

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
end

