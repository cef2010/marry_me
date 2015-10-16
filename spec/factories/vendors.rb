FactoryGirl.define do
  factory :vendor do
    name "Vendor"
    description "Vendor"
    category "Vendor"
    address "Vendor"
    city "Vendor"
    state "Vendor"
    zip "Vendor"
    website "Vendor"
    phone "Vendor"
    sequence(:email) { |n| "vendor#{n}@marryme.com" }
    password "password"
    latitude 1.0
    longitude 1.0
  end
end
