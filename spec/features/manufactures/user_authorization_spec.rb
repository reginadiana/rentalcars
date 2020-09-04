require 'rails_helper'

feature 'User can not' do
  before :each do
    @manufacturer = create(:manufacturer, name: 'Fiat')
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'to create some manufacturer by route' do
    visit new_manufacturer_path
    expect(current_path).to eq(manufacturers_path)
  end

  scenario 'to edit some manufacturer by route' do
    visit edit_manufacturer_path(@manufacturer)
    expect(current_path).to eq(manufacturers_path)
  end

  scenario 'register valid manufacturer' do
    visit root_path
    click_on 'Fabricantes'

    expect(page).to have_content('Fiat')
    expect(page).not_to have_link 'Registrar novo fabricante'
  end

  scenario 'edit manufacturer' do
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).not_to have_link 'Editar'
  end
  scenario 'delete manufacturer' do
    visit root_path
    click_on 'Fabricantes'
    click_on 'Fiat'

    expect(page).not_to have_link 'Excluir'
  end
end
