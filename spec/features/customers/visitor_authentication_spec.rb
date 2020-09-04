require 'rails_helper'

feature 'Visitor tries to acess customers and' do
  after :each do
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end

  scenario 'cannot view index unless logged in' do
    visit root_path

    expect(page).not_to have_link('Cadastrar Cliente')
  end
  scenario 'cannot view customer index unless logged in' do
    visit customers_path
  end

  scenario 'and must be authenticated' do
    visit new_customer_path
  end

  scenario 'and must be authenticated to edit some customer' do
    customer = create(:customer)

    visit edit_customer_path(customer)
  end
end
