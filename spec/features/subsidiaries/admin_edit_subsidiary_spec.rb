require 'rails_helper'

feature 'Admin edits subsidiary' do
  scenario 'successfully' do
    Subsidiary.create!(name: 'Paulista', cnpj: '99.168.496/0001-74', address: 'Rua: Brigadeiro, Paulista')
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Paulista'
    click_on 'Editar'
    fill_in 'Nome', with: 'ARCOM'
    click_on 'Enviar'

    expect(page).to have_content('ARCOM')
  end

  scenario 'cant not to be blank' do
    Subsidiary.create!(name: 'Paulista', cnpj: '99.168.496/0001-74', address: 'Rua: Brigadeiro, Paulista')
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Paulista'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'Cnpj', with: ''
    fill_in 'Endereço', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Cnpj não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')
  end

  scenario 'name must be unique' do
    Subsidiary.create!(name: 'Paulista', cnpj: '99.168.496/0001-74', address: 'Rua: Brigadeiro, Paulista')
    Subsidiary.create!(name: 'ACCENTURE', cnpj: '85.171.517/0001-04', address: 'Rua: Brigadeiro, Paulista')

    user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Paulista'
    click_on 'Editar'

    fill_in 'Nome', with: 'ACCENTURE'

    click_on 'Enviar'

    expect(page).to have_content('já está em uso')
  end

  scenario 'and return to list subsidiaries' do
    Subsidiary.create!(name: 'Paulista', cnpj: '99.168.496/0001-74', address: 'Rua: Brigadeiro, Paulista')

    user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Paulista'
    click_on 'Editar'

    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end
end
