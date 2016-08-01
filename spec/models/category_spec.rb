require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new }

  describe "Validations" do
    it "is valid with valid name" do
      subject.name = "Lunch"
      expect(subject).to be_valid
    end

    it "is not valid without name" do
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to(:parent_category) }
    it { should have_many(:subcategories) }
  end
end
