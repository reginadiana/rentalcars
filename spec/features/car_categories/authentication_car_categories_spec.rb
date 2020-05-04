require 'rails_helper'

feature 'Visitor tries to acess car categories and' do
	scenario 'cannot view index unless logged in' do
		visit root_path

		expect(page).not_to have_link('Categorias de Carros')
	end

	scenario 'cannot view car category index unless logged in' do
		visit car_categories_path

		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
	end
        scenario 'and must be authenticated to see detals' do
		car_category = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

		visit car_category_path(car_category)

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
  	scenario 'and must be authenticated to create a new category' do

    		visit new_car_category_path

    		expect(current_path).to eq(new_user_session_path)	
    		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
        scenario 'and must be authenticated to edit some category' do
		car_category = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

		visit edit_car_category_path(car_category)

		expect(current_path).to eq(new_user_session_path)	
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
   	end
end
