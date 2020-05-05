require 'rails_helper'

RSpec.describe Rental, type: :model do
	it 'should generate a code on create' do
		customer = Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
		car_category = CarCategory.create!(name: 'A', daily_rate: 50, car_insurance: 50, third_part_insurance: 30)
		rental = Rental.new(start_date: 1.day.from_now, end_date: 2.day.from_now, customer: customer, car_category: car_category)

		rental.save
		expect(rental.code).to_not be_blank
	end
end
