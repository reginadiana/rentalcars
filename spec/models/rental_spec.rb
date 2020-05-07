require 'rails_helper'

RSpec.describe Rental, type: :model do
	it 'should generate a code on create' do
		customer = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)
		rental = Rental.new(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

		rental.save
		expect(rental.code).to_not be_blank
	end
	context '#search' do
		it 'finds nothing' do
			customer = Customer.create!(name: 'Diana', document: '505.450.444-17', email: 'diana@gmail.com')
			car_category = CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 100, third_part_insurance: 100)
			user = User.create!(email: 'teste@teste.com.br', password: '12345678')

			rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

			another_rental = Rental.create!(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

			result = Rental.find_by(code: 'AAAAAA')

			expect(result).to be_blank
		end
	end
end
