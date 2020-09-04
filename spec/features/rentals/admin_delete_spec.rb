require 'rails_helper'

feature 'Admin deletes rental' do
  before :each do
    user = create(:user)

    login_as user, scope: :user
  end

  scenario 'successfully' do
    create(:customer)
    create(:car_category)
    rental = create(:rental)

    visit root_path
    click_on 'Locações'
    find("a#delete-#{rental.id}").click

    expect(current_path).to eq rentals_path
    expect(page).to have_content('Nenhuma locação registrada')
  end

  scenario 'and keep anothers' do
    customer_a = create(:customer, name: 'Diana')
    customer_b = create(:customer, name: 'Vitor')

    create(:car_category)
    create(:car_category)

    rental = create(:rental, customer: customer_a)
    create(:rental, customer: customer_b)

    visit root_path
    click_on 'Locações'
    find("a#delete-#{rental.id}").click

    expect(current_path).to eq rentals_path
    expect(page).not_to have_content('Diana')
    expect(page).to have_content('Vitor')
  end
end
