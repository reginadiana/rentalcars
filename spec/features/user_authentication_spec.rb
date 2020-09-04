require 'rails_helper'

feature 'User authentication' do
  context 'log in' do
    scenario 'successfully' do
      subsidiary = create(:subsidiary)
      user = User.create!(email: 'teste@teste.com.br', password: '12345678', subsidiary: subsidiary)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Login efetuado com sucesso!')
      expect(page).not_to have_link('Entrar')
      expect(page).to have_link('Sair')
      expect(current_path).to eq(root_path)
    end

    scenario 'and must fill in all fields' do
      visit new_user_session_path

      within 'form' do
        click_on 'Entrar'
      end

      expect(page).to have_content('Email ou senha inválida.')

      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
    end
  end

  context 'log out' do
    xscenario 'successfully' do
      subsidiary = create(:subsidiary)
      user = User.create!(email: 'teste@teste.com.br', password: '12345678', subsidiary: subsidiary)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Senha', with: user.password
      within 'form' do
        click_on 'Entrar'
      end
      click_on 'Sair'

      expect(page).to have_content('Saiu com sucesso')
      expect(page).to have_link('Entrar')
      expect(page).not_to have_link('Sair')
      expect(current_path).to eq(root_path)
    end
  end

  xcontext 'sign up' do
    scenario 'successfully' do
      visit new_user_session_path

      click_on 'Criar conta'

      subsidiary = create(:subsidiary, name: 'AMC')
      select subsidiary.name, from: 'Filial'
      fill_in 'Email', with: 'test@test.com.br'
      fill_in 'Senha', with: '12345678'
      fill_in 'Confirmação de senha', with: '12345678'
      within 'form' do
        click_on 'Cadastrar-me'
      end

      expect(page).to have_content('Login efetuado com sucesso.')
      expect(page).to have_link('Sair')
      expect(page).not_to have_link('Entrar')
    end
  end
end
