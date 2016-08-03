require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:category) }
  end
end
