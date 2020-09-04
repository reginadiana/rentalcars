require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    subsidiary = create(:subsidiary)
    user = User.create!(email: 'teste@teste.com.br', password: '12345678', subsidiary: subsidiary)
    login_as user, scope: :user

    visit root_path

    expect(page).to have_content('Rental Cars')
    expect(page).to have_content('Bem vindo ao sistema de gestão de locação')

    expect(page).to have_link 'Home'
    expect(page).to have_link 'Clientes'
    expect(page).to have_link 'Fabricantes'
    expect(page).to have_link 'Locações'
    expect(page).to have_link 'Filiais'
    expect(page).to have_link 'Modelos de Carros'
    expect(page).to have_link 'Categorias de Carros'
    expect(page).to have_link 'Carros das Frotas'
    expect(page).to have_link 'Sair'

    expect(page).not_to have_link 'Entrar'
  end
end
