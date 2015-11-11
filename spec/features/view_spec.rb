require 'rails_helper'

feature 'click on specific vendors', :js => true do
  before(:each) do
    visit vendors_path
  end

  scenario 'click on florists' do
    find_button('Florists').click
  end

  scenario 'search for utah' do
    fill_in('search', :with => 'Utah')
  end



end
