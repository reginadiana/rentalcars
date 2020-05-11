require 'rails_helper'

feature 'Visitor tries to acess car categories and' do

	after :each do
		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
	end

	scenario 'cannot view index unless logged in' do
		visit root_path

		expect(page).not_to have_link('Categorias de Carros')
	end

	scenario 'cannot view car category index unless logged in' do
		visit car_categories_path
	end
        scenario 'and must be authenticated to see detals' do
		car_category = create(:car_category)

		visit car_category_path(car_category)
   	end
  	scenario 'and must be authenticated to create a new category' do

    		visit new_car_category_path
   	end
        scenario 'and must be authenticated to edit some category' do
		car_category = create(:car_category)

		visit edit_car_category_path(car_category)
   	end
end
