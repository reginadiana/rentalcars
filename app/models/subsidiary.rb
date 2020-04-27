class Subsidiary < ApplicationRecord
	validates :name, :cnpj, presence: { message: 'nao pode ficar em branco'}
	validates :name, uniqueness: { message: 'ja esta em uso'}
	#validate :cnpj_must_be_valid

	#private
	
	#def cnpj_must_be_valid
	#	return if CNPJ.valid?(cnpj, strict: true)
	#		errors.add(:cnpj, 'cnpj invalido')
	#end
end
