require 'rails_helper'

feature 'User can not' do
  before :each do
    @car_category = create(:car_category, name: 'A')
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'to create some car category by route' do
    visit new_car_category_path
    expect(current_path).to eq(car_categories_path)
  end

  scenario 'to edit some car category by route' do
    visit edit_car_category_path(@car_category)
    expect(current_path).to eq(car_categories_path)
  end

  scenario 'register valid car category' do
    visit root_path
    click_on 'Categorias de Carros'

    expect(page).to have_content('A')
    expect(page).not_to have_link 'Registrar nova Categoria'
  end

  scenario 'edit car category' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'A'

    expect(page).not_to have_link 'Editar'
  end
  scenario 'delete car category' do
    visit root_path
    click_on 'Categorias de Carros'
    click_on 'A'

    expect(page).not_to have_link 'Excluir'
  end
end
