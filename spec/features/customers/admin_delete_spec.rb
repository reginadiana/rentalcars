require 'rails_helper'

feature 'Admin deletes customers' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'successfully' do
    customer_a = create(:customer, name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')

    visit root_path
    click_on 'Clientes'
    find("a#delete-#{customer_a.id}").click

    expect(current_path).to eq customers_path
    expect(page).to have_content('Nenhum cliente cadastrado')
  end

  scenario 'and keep anothers' do
    customer_a = create(:customer, name: 'Lucas')
    create(:customer, name: 'Sara')

    visit root_path
    click_on 'Clientes'
    find("a#delete-#{customer_a.id}").click

    expect(current_path).to eq customers_path
    expect(page).not_to have_content('Lucas')
    expect(page).to have_content('Sara')
  end
end
