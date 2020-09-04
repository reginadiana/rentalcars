require 'rails_helper'

feature 'Admin edits car models' do
  before :each do
    user = create(:user)
    user.admin!

    login_as user, scope: :user
  end

  scenario 'successfully' do
    car_model = create(:car_model)

    visit root_path
    click_on 'Modelos de Carros'
    find("a#details-#{car_model.id}").click

    click_on 'Editar'
    fill_in 'Nome', with: 'Carro Simples'
    click_on 'Enviar'

    expect(page).to have_content('Carro Simples')
  end

  scenario 'and cannot be black' do
    car_model = create(:car_model)

    visit root_path
    click_on 'Modelos de Carros'
    find("a#details-#{car_model.id}").click

    click_on 'Editar'
    fill_in 'Nome', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
  end
end
