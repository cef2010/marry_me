FactoryGirl.define do
  factory :vendor do
    name "Vendor"
    description "Vendor"
    type "Vendor"
    address "Vendor"
    website "Vendor"
    phone "Vendor"
    sequence(:email) { |n| "vendor#{n}@marryme.com" }
    password "password"
  end
end
