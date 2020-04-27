require 'rails_helper'

feature 'Admin register valid car category' do
  scenario 'and name must be unique' do
    CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Registrar nova Categoria'

    fill_in 'Nome', with: 'A'

    click_on 'Enviar'

    expect(page).to have_content('Esta categoria já foi criada')
  end

  scenario 'and name can not be blank' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'Registrar nova Categoria'

    fill_in 'Nome', with: ''
    fill_in 'Daily Rate', with: ''
    fill_in 'Car Insurance', with: ''
    fill_in 'Third Part Insurance', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Preencha todos os campos')
  end

end

