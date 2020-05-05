class Customer < ApplicationRecord
	validates :document, :email, uniqueness: true
	validates :name, :document, :email, presence: true
end
