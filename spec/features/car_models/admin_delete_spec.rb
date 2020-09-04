require 'rails_helper'

feature 'Admin deletes car models' do
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

    click_on 'Excluir'

    expect(current_path).to eq car_models_path
    expect(page).to have_content('Nenhum modelo cadastrado')
  end

  scenario 'and keep anothers' do
    car_model = create(:car_model, name: 'Uno')
    create(:car_model, name: 'Dobles')

    visit root_path
    click_on 'Modelos de Carros'
    find("a#details-#{car_model.id}").click
    click_on 'Excluir'

    expect(current_path).to eq car_models_path
    expect(page).not_to have_content('Uno')
    expect(page).to have_content('Dobles')
  end
end
