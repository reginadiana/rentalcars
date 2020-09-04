require 'rails_helper'

feature 'User start rental' do
  scenario 'successfully by search' do
    manufacturer = create(:manufacturer)
    car_category = create(:car_category)
    car_model = create(:car_model, manufacturer: manufacturer, car_category: car_category)

    car = create(:car, license_plate: 'ABC1234', car_model: car_model)
    car.available!

    customer = create(:customer, name: 'Fulano Sicrano',
                                 email: 'teste@teste.com.br')

    rental = create(:rental, customer: customer,
                             car_category: car_model.car_category)

    add_on = create(:add_on)

    user = create(:user)
    login_as user, scope: :user

    visit search_rentals_path(q: rental.code)
    click_on 'Iniciar'

    expect(page).to have_link 'Voltar'
    select car.license_plate, from: 'Carro'
    select add_on.name, from: 'Acessório'
    click_on 'Confirmar locação'

    expect(page).to have_content(I18n.l(Time.zone.now, format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end

  scenario 'from customer page' do
    car_model = create(:car_model)
    car = create(:car, license_plate: 'ABC1234', car_model: car_model)
    car.available!
    customer = create(:customer, name: 'Fulano Sicrano',
                                 email: 'teste@teste.com.br')
    create(:rental, customer: customer, car_category: car_model.car_category)

    add_on = create(:add_on)

    user = create(:user)
    login_as user, scope: :user

    visit customer_path(customer)
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    select add_on.name, from: 'Acessório'

    click_on 'Confirmar locação'

    expect(page).to have_content(I18n.l(Time.zone.now, format: :long))
    expect(page).to have_content(car.license_plate)
    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content('Em progresso')
    expect(page).to have_content(user.email)
  end

  scenario 'and car is unavailable' do
    user = create(:user)
    login_as user, scope: :user

    customer = create(:customer)
    add_on = create(:add_on)
    car = create(:car, license_plate: 'ABC1234')
    car.available!

    create(:rental, customer: customer)

    visit customer_path(customer)
    click_on 'Iniciar'
    select car.license_plate, from: 'Carro'
    select add_on.name, from: 'Acessório'

    click_on 'Confirmar locação'

    car.unavailable!

    visit car_path(car)
    expect(page).to have_content('Indisponível')
  end
end
