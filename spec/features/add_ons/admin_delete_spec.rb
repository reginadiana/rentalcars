require 'rails_helper'

feature 'Admin deletes on' do
  before :each do
    user = create(:user)
    user.admin!
    login_as user, scope: :user
  end

  scenario 'successfully' do
    add_on = AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')

    visit root_path
    click_on 'Lista de Acessórios'
    find("a#delete-#{add_on.id}").click

    expect(current_path).to eq add_ons_path
    expect(page).to have_content('Nenhum acessório cadastrado')
  end

  scenario 'and keep anothers' do
    add_on = AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')
    AddOn.create!(name: 'Porta Copos', daily_rate: '8.99')

    visit root_path
    click_on 'Lista de Acessórios'
    find("a#delete-#{add_on.id}").click

    expect(current_path).to eq add_ons_path
    expect(page).not_to have_content('Carrinho para pets')
    expect(page).to have_content('Porta Copos')
  end
end
