require 'rails_helper'

feature 'Visitor tries to acess manufacturers and' do
	scenario 'cannot view index unless logged in' do
		visit root_path

		expect(page).not_to have_link('Fabricantes')
	end

	scenario 'cannot view manufacturer index unless logged in' do
		visit manufacturers_path

		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
	end
        xscenario 'and must be authenticated to see detals' do

		visit manufacturer_path

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
  	scenario 'and must be authenticated to create a new manufacturer' do

    		visit new_manufacturer_path

    		expect(current_path).to eq(new_user_session_path)	
    		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
        xscenario 'and must be authenticated to edit some manufacturer' do

		visit edit_manufacturer_path

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
end
