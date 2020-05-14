class AddOn < ApplicationRecord
	has_many :car_rentals
	validates :name, :daily_rate, presence: true
	validates :name, uniqueness: true
	validates :daily_rate, :numericality => { greater_than: 0}
end
