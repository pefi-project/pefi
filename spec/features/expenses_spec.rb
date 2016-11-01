require 'rails_helper'

feature 'Expenses', js: true do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    categories.values.each { |name| create :category, name: name }
  end

  scenario 'Log expense' do
    visit new_expense_path

    within('#new_expense') do
      fill_in 'expense[price_cents]', with: beer[:price_cents]
      fill_in 'expense[name]', with: beer[:name]
      select beer[:category].name, from: 'expense[category_id]'
      click_on 'Create Expense'
    end
    new_expense = Expense.last

    expect(new_expense).to be
    expect(new_expense.name).to eq(beer[:name])
    expect(new_expense.price).to eq(Money.new(beer[:price_cents]))
    expect(new_expense.category).to eq(beer[:category])

    expect(page).to have_current_path(expense_path(new_expense))
    expect(page).to have_link(href: category_path(beer[:category]))
    expect(page).to have_link('Edit', href: edit_expense_path(new_expense))
    expect(page).to have_link('All expenses', href: expenses_path)
  end

  scenario 'Delete expense' do
    create :expense, beer

    visit expenses_path
    click_on 'Delete'

    expect(Expense.last).to be_nil
    expect(page).to have_current_path(expenses_path)
    expect(page).not_to have_link('Delete')
  end

  scenario 'Listing all expenses' do
    expenses.each { |e| create :expense, e }

    visit expenses_path

    expect(page).to have_link('Add expense', href: new_expense_path)
    Expense.find_each do |e|
      expect(page).to have_link("#{e.name} (#{e.price})", href: expense_path(e))
      expect(page).to have_link('Delete', href: expense_path(e))
    end
  end

  scenario 'Listing by category' do
    expenses.each { |e| create :expense, e }

    visit category_path(booze)

    Expense.where(category: booze).find_each do |e|
      expect(page).to have_link("#{e.name} (#{e.price})", href: expense_path(e))
      expect(page).to have_link('Delete', href: expense_path(e))
    end
    expect(page).to have_link('Edit', href: edit_category_path(booze))
    expect(page).to have_link('All categories', href: categories_path)
  end

  let(:categories) { { booze: 'Booze', lunch: 'Lunch' } }
  let(:booze) { Category.find_by(name: categories[:booze]) }
  let(:lunch) { Category.find_by(name: categories[:lunch]) }
  let(:expenses) { [beer, whiskey, steak] }
  let(:beer) do
    {
      price_cents: 2500,
      name: 'Beer',
      category: booze
    }
  end
  let(:whiskey) do
    {
      price_cents: 35_000,
      name: 'Whiskey',
      category: booze
    }
  end
  let(:steak) do
    {
      price_cents: 15_000,
      name: 'Steak',
      category: lunch
    }
  end
end
