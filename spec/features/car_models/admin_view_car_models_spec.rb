require 'rails_helper'

feature 'Admin view car models' do
	scenario 'successfully' do
		fiat = Manufacturer.create!(name: 'Fiat')
		ford = Manufacturer.create!(name: 'Ford')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
				motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)
		CarModel.create!(name: 'Ka', year: 2021, manufacturer: ford,
				motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		visit root_path
		click_on 'Modelos de Carros'
		
		expect(page).to have_content 'Fiat'
		expect(page).to have_content 'Uno'
		expect(page).to have_content '2020'

		expect(page).to have_content 'Ford'
		expect(page).to have_content 'Ka'
		expect(page).to have_content '2021'
	end

	scenario 'and view' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)


		visit root_path
		click_on 'Modelos de Carros'
		#click_on 'Ver detalhes'
		find("a#details-#{cat_a.id}").click()

		expect(page).to have_content 'Uno'
		expect(page).to have_content 'Fabricante: Fiat'
		expect(page).to have_content 'Ano: 2020'
		expect(page).to have_content 'Motor: 1.0'
		expect(page).to have_content 'Combustivel: Flex'
		expect(page).to have_content 'Categoria: A'
		expect(page).to have_content 'Diaria: $50.00'
	end
end
