require 'rails_helper'

feature 'User view ons' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'successfully' do
    AddOn.create!(name: 'Carrinho para pets', daily_rate: '8.99')
    AddOn.create!(name: 'GPS', daily_rate: '25.90')

    visit root_path
    click_on 'Lista de Acessórios'

    expect(page).to have_content('Acessório')
    expect(page).to have_content('Diária')

    expect(page).to have_content('Carrinho para pets')
    expect(page).to have_content('R$ 8,99')
    expect(page).to have_content('GPS')
    expect(page).to have_content('R$ 25,90')
  end

  scenario 'and no ons are created' do
    visit root_path
    click_on 'Lista de Acessórios'

    expect(page).to have_content('Nenhum acessório cadastrado')
  end

  scenario 'and return to home page' do
    visit root_path
    click_on 'Lista de Acessórios'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
