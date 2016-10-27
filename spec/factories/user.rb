FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "john.smith.#{n}@example.com" }
    password 'fakepassword'
  end
end
