require 'rails_helper'

feature 'Visitor tries to acess rental and' do
  after :each do
    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end

  scenario 'cannot view index unless logged in' do
    visit root_path

    expect(page).not_to have_link('Locações')
  end
  scenario 'cannot view rental index unless logged in' do
    visit rentals_path
  end

  scenario 'and must be authenticated to see detals' do
    rental = create(:rental)
    visit rental_path(rental)
  end

  scenario 'and must be authenticated to create a new rental' do
    visit new_rental_path
  end
  scenario 'and must be authenticated to edit some rental' do
    rental = create(:rental)

    visit edit_rental_path(rental)
  end
end
