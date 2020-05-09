FactoryBot.define do
	factory :car_category do
		sequence(:name) { | n | "Categoria#{n}" }
		daily_rate { 10 }
		car_insurance { 20 }
		third_part_insurance { 30 }
	end
end
