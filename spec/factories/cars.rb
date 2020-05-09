FactoryBot.define do
	factory :car do
		license_plate { 'ABC1234' }
		color { 'Branco' }
		mileage { 1 }
		car_model
		subsidiary
	end
end 
