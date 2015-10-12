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

    # it 'returns active contracts for vendor' do
    #   contracts
    #   @vendor = vendor
    #   get :show, {id: vendor.id}
    #   @vendor_active = vendor.active_contracts
    #   expect(@vendor_active.count).to eq(5)
    # end
  end

end
