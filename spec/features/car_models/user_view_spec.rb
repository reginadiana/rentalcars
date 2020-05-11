require 'rails_helper'

feature 'User view car models' do

	before :each do
		user = User.create!(email: 'teste@teste.com.br', password: '12345678')
		login_as user, scope: :user
	end

	scenario 'successfully' do
		fiat = Manufacturer.create!(name: 'Fiat')
		ford = Manufacturer.create!(name: 'Ford')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model_a = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
				motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)
		car_model_b = CarModel.create!(name: 'Ka', year: 2021, manufacturer: ford,
				motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)
	
		visit root_path
		click_on 'Modelos de Carros'

		expect(page).to have_content('Nome')
		expect(page).to have_content('Ano')
		expect(page).to have_content('Fabricante')
		
		expect(page).to have_content 'Fiat'
		expect(page).to have_content 'Uno'
		expect(page).to have_content '2020'
		expect(page).to have_link "details-#{car_model_a.id}" 

		expect(page).to have_content 'Ford'
		expect(page).to have_content 'Ka'
		expect(page).to have_content '2021'
		expect(page).to have_link "details-#{car_model_b.id}" 
	end

	scenario 'and view' do
		fiat = Manufacturer.create!(name: 'Fiat')
		cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

		car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

		visit root_path
		click_on 'Modelos de Carros'
		find("a#details-#{car_model.id}").click()

		expect(page).to have_content('Modelo de Carro')
		expect(page).to have_content('Ano')
		expect(page).to have_content('Fabricante')
		expect(page).to have_content('Motor')
		expect(page).to have_content('Combustivel')
		expect(page).to have_content('Categoria do Carro')
		expect(page).to have_content('Diária')

		expect(page).to have_content 'Uno'
		expect(page).to have_content 'Fiat'
		expect(page).to have_content '2020'
		expect(page).to have_content '1.0'
		expect(page).to have_content 'Flex'
		expect(page).to have_content 'A'
		expect(page).to have_content 'R$ 50,00'
	end

	scenario 'and return to home page' do
	
		visit root_path
		click_on 'Modelos de Carros'
		click_on 'Voltar'

		expect(current_path).to eq root_path
	end
end
