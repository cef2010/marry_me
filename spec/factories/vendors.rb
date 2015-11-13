FactoryGirl.define do
name_array = ['Bobs', 'Vendor']
  factory :vendor do
    name name_array.sample
    description 'Vendor'
    category 'Vendor'
    address 'Vendor'
    city 'Vendor'
    state 'Vendor'
    zip 'Vendor'
    website 'Vendor'
    phone 'Vendor'
    sequence(:email) { |n| "vendor#{n}@marryme.com" }
    password 'password'
    latitude {rand(30..50)}
    longitude {rand(70..120)* -1}
  end
end
