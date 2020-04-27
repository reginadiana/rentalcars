require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locação')

    expect(page).to have_link('Fabricantes', href: manufacturers_path)
    expect(page).to have_link('Categorias de Carros', href: car_categories_path)
    expect(page).to have_link('Modelo de Carros', href: car_models_path)
    expect(page).to have_link('Cadastrar Cliente', href: new_customer_path)
  end
end
