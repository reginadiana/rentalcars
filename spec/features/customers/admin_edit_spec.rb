require 'rails_helper'

feature 'Admin edits customers' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'successfully' do
    customer = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')

    visit root_path
    click_on 'Clientes'
    find("a#edit-#{customer.id}").click
    fill_in 'Nome', with: 'Sara'
    click_on 'Enviar'

    expect(page).to have_content('Sara')
  end

  scenario 'can not be blank' do
    customer = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')

    visit root_path
    click_on 'Clientes'
    find("a#edit-#{customer.id}").click

    fill_in 'Nome', with: ''
    fill_in 'CPF', with: ''
    fill_in 'Email', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Nome não pode ficar em branco')
    expect(page).to have_content('CPF não pode ficar em branco')
    expect(page).to have_content('Email não pode ficar em branco')
  end

  scenario 'CPF and Email must be unique' do
    create(:customer, document: '452.176.388-00', email: 'sarinha@gmail.com')
    customer = create(:customer)

    visit root_path
    click_on 'Clientes'
    find("a#edit-#{customer.id}").click

    fill_in 'CPF', with: '452.176.388-00'
    fill_in 'Email', with: 'sarinha@gmail.com'

    click_on 'Enviar'

    expect(page).to have_content('CPF já está em uso')
    expect(page).to have_content('Email já está em uso')
  end

  scenario 'and return to customers list ' do
    customer_a = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')

    visit root_path
    click_on 'Clientes'
    find("a#edit-#{customer_a.id}").click

    click_on 'Voltar'

    expect(current_path).to eq customers_path
  end
end
