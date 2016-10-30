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

      expect(page).to have_current_path(category_path(new_category))
      expect(page).to have_link('Edit', href: edit_category_path(new_category))
      expect(page).to have_link('All categories', href: categories_path)
    end

    scenario 'List categories' do
      names = %w(Category1 Category2)
      names.each { |name| create :category, name: name }

      visit categories_path

      names.each do |name|
        category = Category.find_by(name: name)
        expect(page).to have_content(category.name)
        expect(page).to have_link('Delete', href: category_path(category))
      end

      expect(page).to have_link('Add category', href: new_category_path)
    end
  end
end
