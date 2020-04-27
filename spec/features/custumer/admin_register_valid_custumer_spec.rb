require 'rails_helper'

feature 'Admin register valid custumer' do
  scenario 'and name must be unique' do
    Customer.create!(name: 'Lucas', document: '508.218.249.15', email: 'lucas@gmail.com')
    visit root_path
    click_on 'Cadastrar Cliente'
	
    fill_in 'Documento', with: '508.218.249.15'

    click_on 'Enviar'

    expect(page).to have_content('Documento deve ser único')
  end

  scenario 'and name can not be blank' do
    visit root_path
    click_on 'Cadastrar Cliente'

    fill_in 'Nome', with: ''
    fill_in 'Document', with: ''
    fill_in 'Email', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Preencha todos os campos')
  end

end

