require 'rails_helper'

feature 'User view car categories' do

	before :each do
	        user = create(:user)
	        login_as user, scope: :user
	end

	scenario 'successfully' do
		car_category_a = create(:car_category, name: 'A', daily_rate: 10)
		car_category_b = create(:car_category, name: 'B', daily_rate: 70)

		visit root_path
		click_on 'Categorias de Carros'

		expect(page).to have_content 'Categoria'
		expect(page).to have_content 'Diária'
		
		expect(page).to have_content "A"
		expect(page).to have_content "R$ 10,00"

		expect(page).to have_content 'B'
		expect(page).to have_content 'R$ 70,00'
	end

	scenario 'and return to home page' do

	    visit root_path
	    click_on 'Categorias de Carros'
	    click_on 'Voltar'

	    expect(current_path).to eq root_path
	end

	scenario 'view car category details' do
		car_category = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

		car_model_uno = create(:car_model, name: 'Uno', car_category: car_category)
		car_model_mobi = create(:car_model, name: 'Mobi', car_category: car_category)

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'A'

		expect(page).to have_content 'Categoria'
		expect(page).to have_content 'Diária'
		expect(page).to have_content 'Seguro do Carro'
		expect(page).to have_content 'Seguro para Terceiros'

		expect(page).to have_content 'A'
		expect(page).to have_content 'R$ 50,00'
		expect(page).to have_content 'R$ 50,00'
		expect(page).to have_content 'R$ 30,00'

		expect(page).to have_link('Uno', href: car_model_path(car_model_uno)) 
		expect(page).to have_link('Mobi', href: car_model_path(car_model_mobi)) 	
		expect(page).to have_link('Voltar', href: car_categories_path)
		
		
	end	
	
	scenario 'and view filtered car models' do

		car_category_a = create(:car_category, name: 'A')

		car_model_uno = create(:car_model, name: 'Uno', car_category: car_category_a)
		car_model_argos = create(:car_model, name: 'Argos')

		visit root_path
		click_on 'Categorias de Carros'
		click_on 'A'

		expect(page).to have_link('Uno', href: car_model_path(car_model_uno)) 
		expect(page).not_to have_link('Argos') 	

	end

	scenario 'empty list' do

		visit root_path
		click_on 'Categorias de Carros'

		expect(page).to have_content('Nenhuma categoria cadastrada')
	end
end
