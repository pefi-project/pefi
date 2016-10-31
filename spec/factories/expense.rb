FactoryGirl.define do
  factory :expense do
    date { DateTime.now }
  end
end
