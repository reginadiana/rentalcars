class Customer < ApplicationRecord
	validates :document, uniqueness: { message: 'Documento deve ser único' }
	validates :name, :document, :email, presence: { message: 'Preencha todos os campos'}
end
