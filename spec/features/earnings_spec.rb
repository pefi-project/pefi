require 'rails_helper'

feature 'Earnings', js: true do
  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
  end

  scenario 'Create earning' do
    visit new_earning_path

    within('#new_earning') do
      fill_in 'earning[name]', with: paycheck[:name]
      fill_in 'earning[amount_cents]', with: paycheck[:amount_cents]
      click_on 'Create Earning'
    end
    new_earning = Earning.last

    expect(new_earning).to be
    expect(new_earning.name).to eq(paycheck[:name])
    expect(new_earning.amount).to eq(Money.new(paycheck[:amount_cents]))

    expect(page).to have_current_path(earning_path(new_earning))
    expect(page).to have_link('Edit', href: edit_earning_path(new_earning))
    expect(page).to have_link('All earnings', href: earnings_path)
  end

  scenario 'Deleting earning' do
    create :earning, paycheck

    visit earnings_path
    click_on 'Delete'

    expect(Earning.last).to be_nil
    expect(page).to have_current_path(earnings_path)
    expect(page).not_to have_link('Delete')
  end

  scenario 'List earnings' do
    test_earnings.each { |name| create :earning, name: name, amount_cents: 1 }

    visit earnings_path

    Earning.find_each do |e|
      expect(page).to have_content(e.name)
      expect(page).to have_link('Delete', href: earning_path(e))
    end

    expect(page).to have_link('Add earning', href: new_earning_path)
  end

  let(:test_earnings) { %w(Paycheck LotteryTickets) }
  let(:paycheck) do
    {
      name: 'Paycheck',
      amount_cents: 500_000
    }
  end
end
