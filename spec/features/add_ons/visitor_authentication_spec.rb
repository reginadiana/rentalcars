require 'rails_helper'

feature 'Visitor tries to acess ons and' do

	after :each do
		expect(current_path).to eq(new_user_session_path)
		expect(page).to have_content('Para continuar, efetue login ou registre-se.')
	end

	scenario 'cannot view index unless logged in' do
		visit root_path

		expect(page).not_to have_link('Cadastrar Acessório')
	end
	scenario 'cannot view on index unless logged in' do
		visit add_ons_path
	end

  	scenario 'and must be authenticated' do
		visit new_add_on_path	
  	end

        scenario 'and must be authenticated to edit some ons' do
		add_on = create(:add_on)

		visit edit_customer_path(add_on)
   	end

end
