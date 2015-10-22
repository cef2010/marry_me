require 'rails_helper'

RSpec.describe VendorsController, type: :controller do
  let(:vendor) { FactoryGirl.create(:vendor) }
  # let(:couple) { FactoryGirl.create(:couple) }
  # let(:contracts) { create_list(:contract, 5, vendor_id: vendor.id, couple_id: couple.id) }
  # let(:pending_contracts) { create_list(:contract, 5, vendor_id: vendor.id, couple_id: couple.id, couple_pending: true) }
  # let(:requested_contracts) { create_list(:contract, 5, vendor_id: vendor.id, couple_id: couple.id, vendor_pending: true) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: vendor.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'updates a couple' do
      update_params = {id: vendor.id, vendor: {name: 'Hello!'}}
      put :update, update_params
      vendor.reload
      expect(vendor.name).to eq('Hello!')
    end
  end

  describe 'GET #sort by type' do
    it 'returns vendors within a category' do
      attire = create_list(:vendor, 5, category: 'Attire')
      get :sort_by_type, {vendor: {category: 'Baker'}}
      expect(Vendor.attires.count).to eq(5)
    end
  end
end

# it 'queries a vendor category' do
#   bakers = create_list(:vendor, 5, category: 'Baker')
#   expect(Vendor.search("Baker").count).to eq(5)
# end
