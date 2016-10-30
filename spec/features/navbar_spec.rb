require 'rails_helper'

feature 'Navbar links', js: true do
  scenario 'when not signed in' do
    visit root_path

    expect(page).to have_link('Home', href: root_path)
    expect(page).to have_link('About', href: '#')
    expect(page).to have_link('Sign in', href: new_user_session_path)
  end

  scenario 'when signed in' do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)

    visit root_path

    expect(page).to have_link('Home', href: root_path)
    expect(page).to have_link('Leaderboard', href: '#')
    expect(page).to have_link('Stats', href: '#')

    expect(page).to have_link('About', href: '#')
    expect(page).to have_link('My Account', href: '#')
    expect(page).to have_link('Sign out', href: destroy_user_session_path)
  end
end
