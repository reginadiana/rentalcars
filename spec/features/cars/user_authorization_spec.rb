require 'rails_helper'

feature 'User can not' do
  before :each do
    @car = create(:car, license_plate: 'ABC1234')
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'to create some car by route' do
    visit new_car_path
    expect(current_path).to eq(cars_path)
  end

  scenario 'to edit some car by route' do
    visit edit_car_path(@car)
    expect(current_path).to eq(cars_path)
  end

  scenario 'register valid car' do
    visit root_path
    click_on 'Carros das Frotas'

    expect(page).to have_content('ABC1234')
    expect(page).not_to have_link 'Registrar novo carro'
  end

  scenario 'edit car' do
    visit root_path
    click_on 'Carros das Frotas'
    click_on 'ABC1234'

    expect(page).not_to have_link 'Editar'
  end
  scenario 'delete car' do
    visit root_path
    click_on 'Carros das Frotas'
    click_on 'ABC1234'

    expect(page).not_to have_link 'Excluir'
  end
end
