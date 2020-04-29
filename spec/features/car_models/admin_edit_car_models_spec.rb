require 'rails_helper'

feature 'Admin edits car models' do
  scenario 'successfully' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

    CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

    visit root_path
    click_on 'Modelos de Carros'
    find("a#details-#{cat_a.id}").click()

    click_on 'Editar'
    fill_in 'Nome', with: 'Carro Simples'
    click_on 'Enviar'

    expect(page).to have_content('Carro Simples')
  end

  scenario 'and cannot be black' do
    fiat = Manufacturer.create!(name: 'Fiat')
    cat_a = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)

    CarModel.create!(name: 'Uno', year: 2020, manufacturer: fiat, motorization: '1.0', fuel_type: 'Flex', car_category: cat_a)

    visit root_path
    click_on 'Modelos de Carros'
    find("a#details-#{cat_a.id}").click()

    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end
end
