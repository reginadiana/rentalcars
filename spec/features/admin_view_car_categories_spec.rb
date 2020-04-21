require 'rails_helper'

feature 'Admin view car categories' do
	scenario 'successfully' do
		CarCategory.create!(name: 'A', daily_rate: 50)
		CarCategory.create!(name: 'B', daily_rate: 70)
		

		visit root_path
		click_on 'Categorias de Carros'
		
		expect(page).to have_content 'Categoria A'
		expect(page).to have_content '$50.00'

		expect(page).to have_content 'Categoria B'
		expect(page).to have_content '$70.00'
	end

	scenario 'view car category details' do
		CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)
		
		visit root_path
		click_on 'Categoria de Carros'
		click_on 'Categoria A'

		expect(page).to have_content 'Categoria A'
		expect(page).to have_content 'Diaria: $50.00'
		expect(page).to have_content 'Seguro do Carro: $50.00'
		expect(page).to have_content 'Seguro para Terceiros: $30.00'
		
	end

	scenario 'empty list' do
	end
end
