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
      expect(vendor.name).to eq("Vendor")
      update_params = {id: vendor.id, vendor: {name: 'Hello!'}}
      put :update, update_params
      vendor.reload
      expect(vendor.name).to eq('Hello!')
    end
  end
end

# describe 'PUT #update' do
#   it 'updates a couple' do
#     put :update, {id: couple.id, couple: {description: 'hello'}}
#     couple.reload
#     expect(couple.description).to eq('hello')
#   end
# end
