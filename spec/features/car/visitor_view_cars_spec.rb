require 'rails_helper'

feature 'Visitor view cars' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

    car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

    subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')

    Car.create!(license_plate: '2508ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)
    Car.create!(license_plate: '1819ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)
    

    visit root_path
    click_on 'Carros das Frotas'

    expect(page).to have_content('2508ABC')
    expect(page).to have_content('1819ABC')
  end

  scenario 'and view details' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, 							third_part_insurance: 30)

    car_model = CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat,
					motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

    subsidiary = Subsidiary.create!(name: 'ACCENTURE', cnpj: '99.168.496/0001-74', address: 'Rua: Paulista')

    Car.create!(license_plate: '2508ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)
    Car.create!(license_plate: '1819ABC', color: 'Pink', car_model: car_model, mileage: 500, subsidiary: subsidiary)

    visit root_path
    click_on 'Carros Cadastrados'
    click_on '2508ABC'

    expect(page).to have_content('Placa: 2508ABC')
    expect(page).to have_content('Cor: Pink')
    expect(page).to have_link('Uno', href: car_model_path(car_model)) 
    expect(page).to have_content('Quilometragem: 500')
    expect(page).to have_link('ACCENTURE', href: subsidiary_path(subsidiary)) 

  end

  scenario 'and no cars are created' do
    visit root_path
    click_on 'Carros das Frotas'

    expect(page).to have_content('Nenhum carro cadastrado')
  end

  scenario 'and return to home page' do

    visit root_path
    click_on 'Carros das Frotas'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to cars page' do

    visit root_path
    click_on 'Carros das Frotas'
    click_on '2508ABC'
    click_on 'Voltar'

    expect(current_path).to eq cars_path
  end
end
