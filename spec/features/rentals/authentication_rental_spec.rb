require 'rails_helper'

feature 'Visitor tries to acess rental and' do
	scenario 'and must be authenticated to create a new rental' do
		visit new_rental_path

		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')	
	end

  	scenario 'cannot view index unless logged in' do
    		visit root_path

    		expect(page).not_to have_link('Locações')
  	end

  	scenario 'cannot view rental index unless logged in' do
    		visit rentals_path

    		expect(current_path).to eq(new_user_session_path)
  	end
end
