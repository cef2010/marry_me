FactoryGirl.define do
  factory :couple do
    sequence(:email) { |n| "couple#{n}@marryme.com" }
    password "password"
      
  end
end
