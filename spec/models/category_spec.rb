require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new }

  it "is valid with valid name" do
    subject.name = "Lunch"
    expect(subject).to be_valid
  end

  it "is not valid without name" do
    expect(subject).to_not be_valid
  end

  it "is valid with valid children categories"
  it "is valid with parent category"
end
