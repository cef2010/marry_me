require 'populator'
require 'faker'

namespace :db do
  desc 'creates all categories of vendors'
  task populate: :environment do
    category = %w(Florist Attire Music Venue Baker Caterer Photographer Videographer Photobooth Invitation Rental Other )

    Vendor.populate 30 do |vendor|
      vendor.name = Faker::Name.name
      vendor.email = Faker::Internet.email
      vendor.encrypted_password = Vendor.new(password: 'password').encrypted_password
      vendor.created_at = Faker::Date.backward(365)
      vendor.updated_at = Faker::Date.backward(365)
      vendor.sign_in_count = 1
      vendor.description = Faker::Lorem.sentence(2)
      vendor.category = category.sample
      vendor.address = Faker::Address.street_address
      vendor.city = Faker::Address.city
      vendor.state = Faker::Address.state
      vendor.zip = Faker::Address.zip
      vendor.website = Faker::Internet.domain_name
      vendor.phone = Faker::PhoneNumber.cell_phone
      vendor.latitude = Faker::Address.latitude
      vendor.longitude = Faker::Address.longitude
    end
  end
end
