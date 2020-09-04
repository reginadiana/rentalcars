require 'rails_helper'

feature 'Visitor tries to acess car models and' do
  after :each do
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end

  scenario 'cannot view index unless logged in' do
    visit root_path

    expect(page).not_to have_link('Modelos de Carros')
  end

  scenario 'cannot view car model index unless logged in' do
    visit car_models_path
  end

  scenario 'and must be authenticated to see detals' do
    car_model = create(:car_model)
    visit car_model_path(car_model)
  end

  scenario 'and must be authenticated to create a new model' do
    visit new_car_model_path
  end

  scenario 'and must be authenticated to edit some model' do
    car_model = create(:car_model)
    visit edit_car_model_path(car_model)
  end
end
