class CarCategory < ApplicationRecord
	has_many :car_models
	validates :name, uniqueness: { message: 'Esta categoria já foi criada' }
	validates :name, :daily_rate, :car_insurance, :third_part_insurance, presence: { message: 'Preencha todos os campos'}
end
