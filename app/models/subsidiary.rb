class Subsidiary < ApplicationRecord
	validates :name, :cnpj, presence: { message: 'nao pode ficar em branco' }
	validates :name, uniqueness: { message: 'ja esta em uso'}
	validates :cnpj, format: { with: /\A^\d{2,3}\.\d{3}\.\d{3}\/\d{4}\-\d{2}$\z/ }
	validate :cnpj_must_be_valid

	private
	
	def cnpj_must_be_valid
		if CNPJ.valid?(cnpj, strict: true)
			errors.add(:cnpj, :invalid)
		end
	end
end
