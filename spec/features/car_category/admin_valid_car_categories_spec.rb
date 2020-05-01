require 'rails_helper'

feature 'Valid car categories if' do

	context '#daily_rate' do
		it('lenght must be bigger then 0') do
			car_category = CarCategory.new(daily_rate: -40)
			car_category.valid?
			expect(car_category.errors[:daily_rate]).to include('deve ser maior ou igual a 0')	
		end
	end

	context '#car_insurance' do
		it('lenght must be bigger then 0') do
			car_category = CarCategory.new(car_insurance: -100)
			car_category.valid?
			expect(car_category.errors[:car_insurance]).to include('deve ser maior ou igual a 0')	
		end
	end

	context '#third_part_insurance' do
		it('lenght must be bigger then 0') do
			car_category = CarCategory.new(third_part_insurance: -55)
			car_category.valid?
			expect(car_category.errors[:third_part_insurance]).to include('deve ser maior ou igual a 0')	
		end
	end
end

