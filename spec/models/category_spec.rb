require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:parent_category) }
    it { is_expected.to have_many(:subcategories) }
  end
end
