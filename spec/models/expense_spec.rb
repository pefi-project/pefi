require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:date) }

    it { is_expected.to monetize(:price) }
    it { is_expected.to validate_presence_of(:price_cents) }
    it { is_expected.to validate_numericality_of(:price_cents).is_greater_than(0) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:category) }
  end
end
