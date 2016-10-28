require 'rails_helper'

feature 'Category management', js: true do
  context 'when signed in' do
    before(:each) do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
    end

    scenario 'Creating new category' do
      visit new_category_path

      within('#new_category') do
        fill_in 'category[name]', with: 'Test'
        click_on 'Create Category'
      end
      new_category = Category.last
      expect(new_category).to be
      expect(new_category.name).to eq('Test')
    end

    scenario 'List categories' do
      create :category, name: 'Category 1'
      create :category, name: 'Category 2'

      visit categories_path

      expect(page).to have_content('Category 1')
      expect(page).to have_content('Category 2')
    end
  end

  context 'when not signed in' do
    scenario 'redirect you to log in page' do
      visit categories_path

      expect(page).to have_button('Log in')
    end
  end
end
