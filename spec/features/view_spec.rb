require 'rails_helper'
RSpec.describe "vendors", :type => :request do

  feature 'click on vendor types', :js => true do
  let!(:vendor) { create_list(:vendor, 5) }
  # keypress_script = "var e = $.Event('keydown', { keyCode: #{keycode} }); $('body').trigger(e);"

    before(:each) do
      @vendors = vendor
      hash = Gmaps4rails.build_markers(@vendors) do |vendor, marker|
        if vendor.latitude != nil
          marker.lat vendor.latitude
          marker.lng vendor.longitude
          marker.infowindow "<a href='/vendors/#{vendor.id}'>#{vendor.name}</a>,
                             #{vendor.category}"
        end
      end
      hash.each do |h|
        hash.delete(h) if h == {}
      end
      hash = @hash
      visit vendors_path
    end

    scenario 'search for Bobs' do
      vendor
      fill_in('search', :with => 'Bobs')
      find("#search").native.send_keys :enter
      expect(page).to have_content('Bobs')
      binding.pry
    end



  end
end
