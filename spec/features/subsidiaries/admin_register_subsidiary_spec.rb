require 'rails_helper'

feature 'Admin register valid subsidiary' do
  scenario 'and name must be unique' do
    Subsidiary.create!(name: 'Paulista', cnpj: '99.168.496/0001-74', address: 'Rua: Brigadeiro, Paulista')
    
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Cadastrar uma filial'

    fill_in 'Nome', with: 'Paulista'
    fill_in 'Cnpj', with: '99.168.496/0001-74'
    fill_in 'Endereço', with: 'Rua: Brigadeiro, Paulista'

    click_on 'Enviar'

    expect(page).to have_content('Nome já está em uso')
    expect(page).to have_content('Cnpj já está em uso')
  end

  scenario 'and name, cnpj and address can not be blank' do
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Cadastrar uma filial'

    fill_in 'Nome', with: ''
    fill_in 'Cnpj', with: ''
    fill_in 'Endereço', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('Cnpj não pode ficar em branco')
    expect(page).to have_content('Endereço não pode ficar em branco')

  end

  scenario 'and return to list subsidiaries' do
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')
    login_as user, scope: :user

    visit root_path
    click_on 'Filiais'
    click_on 'Cadastrar uma filial'

    click_on 'Voltar'

    expect(current_path).to eq subsidiaries_path
  end

end

