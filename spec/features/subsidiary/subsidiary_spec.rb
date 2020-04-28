require 'rails_helper'

feature 'Subsidiary' do

	context '#name' do
		it('cannot be black') do
			subsidiary = Subsidiary.new(name: '')
			subsidiary.valid?
			expect(subsidiary.errors[:name]).to include('nao pode ficar em branco')	
		end

		it('must be unique') do
			Subsidiary.create!(name: 'Paulista', cnpj: '75.666.888/1000-09')
			subsidiary = Subsidiary.new(name: 'Paulista')
			subsidiary.valid?
			expect(subsidiary.errors[:name]).to include('ja esta em uso')	
		end
	end
	
	context '#cnpj' do
		it('cannot be black') do
			subsidiary = Subsidiary.new(cnpj: '')
			subsidiary.valid?
			expect(subsidiary.errors[:cnpj]).to include('nao pode ficar em branco')	
		end
		
		xit('must be valid') do
			subsidiary = Subsidiary.new(cnpj: '75.666.888/1000-09')
			subsidiary.valid?
			expect(subsidiary.errors[:cnpj]).to include('Cnpj invalido')	
		end
		
	end
end
