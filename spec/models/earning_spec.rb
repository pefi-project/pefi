require 'rails_helper'

RSpec.describe Earning, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:date) }

    it { is_expected.to monetize(:amount) }
    it { is_expected.to validate_presence_of(:amount_cents) }
    it { is_expected.to validate_numericality_of(:amount_cents).is_greater_than(0) }
  end

  describe '#name' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:name=) }
  end
end
