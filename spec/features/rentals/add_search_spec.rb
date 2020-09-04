require 'rails_helper'

feature 'Admin search rental' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
  end

  scenario 'successfully' do
    rental = create(:rental)
    another_rental = create(:rental)

    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: rental.code
    click_on 'Buscar'

    expect(page).to have_link 'Voltar'
    expect(page).to have_content(rental.code)
    expect(page).not_to have_content(another_rental.code)
  end

  scenario 'and cannot be black' do
    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: ''
    click_on 'Buscar'

    expect(page).to have_link 'Voltar'
    expect(page).to have_content('Nenhum resultado encontrado para:')
  end

  scenario 'and code cannot be found' do
    rental = create(:rental)
    another_rental = create(:rental)

    visit root_path
    click_on 'Locações'
    fill_in 'Código', with: 'ABXUXA'
    click_on 'Buscar'

    expect(page).to have_link 'Voltar'
    expect(page).not_to have_content(rental.code)
    expect(page).not_to have_content(another_rental.code)

    expect(page).to have_content('Nenhum resultado encontrado para: ABXUXA')
  end
end
