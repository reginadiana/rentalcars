require 'rails_helper'

feature 'User view rental' do
  before :each do
    user = create(:user)
    login_as user, scope: :user
  end
  scenario 'successfully' do
    customer = create(:customer, name: 'Diana')
    car_category = create(:car_category, name: 'A')
    rental = create(:rental, start_date: '22/03/1995', end_date: '22/03/2000',
                             customer: customer, car_category: car_category)

    visit root_path
    click_on 'Locações'

    within('.table') do
      expect(page).to have_content('Código')
    end

    expect(page).to have_content('Data de inicio')
    expect(page).to have_content('Data de término')
    expect(page).to have_content('Cliente')
    expect(page).to have_content('Categoria')

    expect(page).to have_content(rental.code.to_s)
    expect(page).to have_content('22/03/1995')
    expect(page).to have_content('22/03/2000')
    expect(page).to have_content('Diana')
    expect(page).to have_content('A')
  end

  scenario 'and no rentals are created' do
    visit root_path
    click_on 'Locações'

    expect(page).to have_content('Nenhuma locação registrada')
  end

  scenario 'and return to home page' do
    visit root_path
    click_on 'Locações'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
