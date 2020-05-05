require 'rails_helper'

feature 'Subsidiary' do

	context '#name' do
		it('cannot be black') do
			subsidiary = Subsidiary.new(name: '')
			subsidiary.valid?
			expect(subsidiary.errors[:name]).to include('não pode ficar em branco')	
		end

		it('must be unique') do
			Subsidiary.create!(name: 'Paulista', cnpj: '99.168.496/0001-74', address: 'Ipiranga')
			subsidiary = Subsidiary.new(name: 'Paulista')
			subsidiary.valid?
			expect(subsidiary.errors[:name]).to include('já está em uso')	
		end
	end
	
	context '#cnpj' do
		it('cannot be black') do
			subsidiary = Subsidiary.new(cnpj: '')
			subsidiary.valid?
			expect(subsidiary.errors[:cnpj]).to include('não pode ficar em branco')	
		end
		
		it('must be valid') do
			subsidiary = Subsidiary.new(cnpj: '75.666.888/1000-09')
			subsidiary.valid?
			expect(subsidiary.errors[:cnpj]).to include('não é válido')	
		end

		it('must be 18 caracters') do
			subsidiary = Subsidiary.new(cnpj: '75.666.888/1000')
			subsidiary.valid?
			expect(subsidiary.errors[:cnpj]).to include('não possui o tamanho esperado (18 caracteres)')	
		end
	end

        context '#address' do
		it('cannot be black') do
			subsidiary = Subsidiary.new(address: '')
			subsidiary.valid?
			expect(subsidiary.errors[:address]).to include('não pode ficar em branco')	
		end
	end
end
