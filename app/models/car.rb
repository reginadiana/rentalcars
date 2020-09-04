class Car < ApplicationRecord
  belongs_to :car_model
  belongs_to :subsidiary

  has_many :car_rentals
  has_many :rentals, through: :car_rentals

  enum status: { unavailable: 0, available: 1 }

  has_one_attached :car_photo

  validates :license_plate, :color, :mileage, presence: true
  validates :license_plate, uniqueness: true
  validates :mileage, numericality: { greater_than: 0 }
end
