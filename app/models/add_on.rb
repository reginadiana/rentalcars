class AddOn < ApplicationRecord
	has_many :car_rentals
	validates :name, :daily_rate, presence: true
end
