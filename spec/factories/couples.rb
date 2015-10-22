FactoryGirl.define do
  factory :couple do
    sequence(:email) { |n| "couple#{n}@marryme.com" }
    password "password"
    description "yay"
    wedding_date "some date"
    budget 5000
    ceremony_location "mars"
    reception_location "jupiter"
  end
end
