require 'rails_helper'

feature 'Category management', js: true do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    test_categories.each { |name| create :category, name: name }
  end

  scenario 'Creating new top level category' do
    visit new_category_path

    within('#new_category') do
      fill_in 'category[name]', with: test_category
      click_on 'Create Category'
    end
    new_category = Category.last

    expect(new_category).to be
    expect(new_category.name).to eq(test_category)
    expect(new_category.parent_category).to be_nil

    expect(page).to have_current_path(category_path(new_category))
    expect(page).to have_link('Edit', href: edit_category_path(new_category))
    expect(page).to have_link('All categories', href: categories_path)
  end

  scenario 'Creating new subcategory' do
    visit new_category_path

    within('#new_category') do
      fill_in 'category[name]', with: test_category
      select test_categories.first, from: 'category[parent_category_id]'
      click_on 'Create Category'
    end
    new_category = Category.last

    expect(new_category).to be
    expect(new_category.name).to eq(test_category)
    expect(new_category.parent_category.name).to eq(test_categories.first)

    expect(page).to have_current_path(category_path(new_category))
    expect(page).to have_link('Edit', href: edit_category_path(new_category))
    expect(page).to have_link('All categories', href: categories_path)
  end

  scenario 'List categories' do
    visit categories_path

    Category.find_each do |category|
      expect(page).to have_content(category.name)
      expect(page).to have_link('Delete', href: category_path(category))
    end

    expect(page).to have_link('Add category', href: new_category_path)
  end

  let(:test_categories) { %w(Category1 Category2) }
  let(:test_category) { 'Test' }
end
