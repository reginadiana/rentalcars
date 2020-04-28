class Manufacturer < ApplicationRecord
	validates :name, uniqueness: { message: 'Nome deve ser único' }
	validates :name, presence: true
end
