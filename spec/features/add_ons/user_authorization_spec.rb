require 'rails_helper'

feature 'User can not' do
  before :each do
    @add_on = create(:add_on, name: 'GPS')
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'to create some on by route' do
    visit new_add_on_path
    expect(current_path).to eq(add_ons_path)
  end

  scenario 'to edit some on by route' do
    visit edit_add_on_path(@add_on)
    expect(current_path).to eq(add_ons_path)
  end

  scenario 'register valid on' do
    visit root_path
    click_on 'Lista de Acessórios'

    expect(page).to have_content('GPS')
    expect(page).not_to have_link 'Cadastrar Acessório'
  end

  scenario 'edit on' do
    visit root_path
    click_on 'Lista de Acessórios'

    expect(page).not_to have_link 'Editar'
  end
  scenario 'delete on' do
    visit root_path
    click_on 'Lista de Acessórios'

    expect(page).not_to have_link 'Excluir'
  end
end
