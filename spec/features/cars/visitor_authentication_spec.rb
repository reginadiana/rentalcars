require 'rails_helper'

feature 'Visitor tries to acess cars and' do

	after :each do
		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
	end

	scenario 'cannot view index unless logged in' do
		visit root_path

		expect(page).not_to have_link('Carros das Frotas')
	end

	scenario 'cannot view car index unless logged in' do
		visit cars_path
	end
        scenario 'and must be authenticated to see detals' do
		car = create(:car)

		visit car_path(car)
   	end
  	scenario 'and must be authenticated to create a new car' do

    		visit new_car_path

   	end
        scenario 'and must be authenticated to edit some car' do
		
		car = create(:car)

		visit edit_car_path(car)
   	end
end
