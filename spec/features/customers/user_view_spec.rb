require 'rails_helper'

feature 'User view customer' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'successfully' do
    customer_a = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
    customer_b = Customer.create!(name: 'Sara', document: '452.176.388-00', email: 'sara@gmail.com')

    visit root_path
    click_on 'Clientes'

    expect(page).to have_content('Cliente')
    expect(page).to have_content('Email')
    expect(page).to have_content('CPF')

    expect(page).to have_content('Lucas')
    expect(page).to have_content('508.218.249.15')
    expect(page).to have_content('lucas@gmail.com')
    expect(page).to have_content('Sara')
    expect(page).to have_content('452.176.388-00')
    expect(page).to have_content('sara@gmail.com')

    expect(page).to have_link "edit-#{customer_a.id}"
    expect(page).to have_link "delete-#{customer_a.id}"

    expect(page).to have_link "edit-#{customer_b.id}"
    expect(page).to have_link "delete-#{customer_b.id}"
  end

  scenario 'and no custumers are created' do
    visit root_path
    click_on 'Clientes'

    expect(page).to have_content('Nenhum cliente cadastrado')
  end

  scenario 'and return to home page' do
    visit root_path
    click_on 'Clientes'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and view customer details of rental' do
    customer = create(:customer)
    rental = create(:rental, customer: customer, start_date: '22/10/1990', end_date: '22/10/1991')

    visit root_path
    click_on 'Clientes'

    within "tr#customer-#{customer.id}" do
      click_on 'Locações'
    end

    expect(page).to have_link 'Voltar'

    expect(page).to have_content(rental.code.to_s)
    expect(page).to have_content('22/10/1990')
    expect(page).to have_content('22/10/1991')
    expect(page).to have_content('Agendada')
  end

  scenario 'without rentals' do
    customer = create(:customer)

    visit root_path
    click_on 'Clientes'

    within "tr#customer-#{customer.id}" do
      click_on 'Locações'
    end

    expect(page).to have_content('Sem locações cadastradas')
  end
end
