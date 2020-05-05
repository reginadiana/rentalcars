require 'rails_helper'

feature 'Admin register valid custumer' do
  scenario 'and name must be unique' do
    Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Cliente'
	
    fill_in 'CPF', with: '508.218.249.15'

    click_on 'Enviar'

    expect(page).to have_content('CPF deve ser único')
  end

  scenario 'and name can not be blank' do
    user = User.create!(email: 'teste@teste.com.br', password: '12345678')

    login_as user, scope: :user
    visit root_path
    click_on 'Clientes'
    click_on 'Cadastrar Cliente'

    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Email', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
  end
end

