require 'rails_helper'

feature 'Admin deletes car categories' do
  before :each do
    user = create(:user)
    user.admin!
    login_as user, scope: :user
  end

  scenario 'successfully' do
    create(:car_category, name: 'D')

    visit root_path
    click_on 'Categorias de Carros'
    click_on 'D'
    click_on 'Excluir'

    expect(current_path).to eq car_categories_path
    expect(page).to have_content('Nenhuma categoria cadastrada')
  end

  scenario 'and keep anothers' do
    create(:car_category, name: 'D')
    create(:car_category, name: 'E')

    visit root_path
    click_on 'Categorias de Carros'
    click_on 'D'
    click_on 'Excluir'

    expect(current_path).to eq car_categories_path

    within('.colums') do
      expect(page).not_to have_content('D')
      expect(page).to have_content('E')
    end
  end
end
