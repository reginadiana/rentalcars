require 'rails_helper'

feature 'Visitor tries to acess manufacturers and' do

	after :each do
		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
	end

	scenario 'cannot view index unless logged in' do
		visit root_path
		expect(page).not_to have_link('Fabricantes')
	end

	scenario 'cannot view manufacturer index unless logged in' do
		visit manufacturers_path
	end
        scenario 'and must be authenticated to see detals' do
		manufacturer = create(:manufacturer)

		visit manufacturer_path(manufacturer)
   	end
  	scenario 'and must be authenticated to create a new manufacturer' do
    		visit new_manufacturer_path
   	end
        scenario 'and must be authenticated to edit some manufacturer' do
		manufacturer = create(:manufacturer)

		visit edit_manufacturer_path(manufacturer)
   	end
end
