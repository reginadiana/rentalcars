class Customer < ApplicationRecord
	validates :document, uniqueness: { message: 'CPF deve ser único' }
	validates :name, :document, :email, presence: true
end
