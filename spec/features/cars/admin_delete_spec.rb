require 'rails_helper'

feature 'Admin deletes cars' do

	before :each do
		user = create(:user)
		user.admin!

		login_as user, scope: :user
	end

	scenario 'successfully' do
		car = create(:car, license_plate: '2508ABC')

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'

		click_on 'Excluir'

		expect(current_path).to eq cars_path
		expect(page).to have_content('Nenhum carro cadastrado')
	end

	scenario 'and keep anothers' do

		car_a = create(:car, license_plate: '2508ABC')
		car_b = create(:car, license_plate: 'XUXUXU')

		visit root_path
		click_on 'Carros das Frotas'
		click_on '2508ABC'
		click_on 'Excluir'

		expect(current_path).to eq cars_path
		expect(page).not_to have_content('2508ABC')
		expect(page).to have_content('XUXUXU')
	end
end
