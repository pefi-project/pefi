require 'rails_helper'

feature 'GET routes', js: true do
  context 'when not signed in' do
    scenario 'redirect you to log in page' do
      expect(paths).to have_exactly(6).items

      paths.each do |path|
        visit path
        expect(page).to have_current_path(new_user_session_path)
      end
    end
  end

  context 'when signed in' do
    before(:each) do
      user = FactoryGirl.create(:user)
      login_as(user, scope: :user)
    end

    scenario 'should load successfully' do
      paths.each do |path|
        visit path
        expect(page).to have_current_path(path)
      end
    end
  end

  let :paths do
    Rails.application
         .routes
         .routes
         .select(&only_get)
         .select(&only_entities)
         .reject(&parameterized)
         .map(&extract_path)
  end

  let(:only_get) { -> (r) { r.verb.to_s.include? 'GET' } }
  let :only_entities do
    lambda do |r|
      entities = %w(category earning expense).flat_map do |e|
        [e, e.pluralize]
      end
      r.path.spec.to_s.match(Regexp.union(entities))
    end
  end
  let(:parameterized) { -> (r) { r.path.spec.to_s.include? ':id' } }
  let(:extract_path) { -> (r) { r.path.spec.to_s.chomp '(.:format)' } }
end
