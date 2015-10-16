require 'rails_helper'

RSpec.describe ContractsController, type: :controller do
  let(:vendor) { FactoryGirl.create(:vendor) }
  let(:couple) { FactoryGirl.create(:couple) }
  let(:contract) { FactoryGirl.create(:contract, vendor_id: vendor.id, couple_id: couple.id) }

  # ask Dave--"current_couple" causing problems
  describe "GET #index" do
    it "returns http success" do
      couple
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      contract
      get :edit, {id: contract.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it 'updates a contract' do
      contract
      update_params = {id: contract.id, contract: {vendor_pending: true}}
      put :update, update_params
      contract.reload
      expect(contract.vendor_pending).to eq(true)
    end
    # add some verify requirements? Otherwise it always updates
    # never hits the else in the controller
  end

  describe "DELETE #destroy" do
    it 'deletes a contract' do
      contract
      delete :destroy, {id: contract.id}
      expect(Contract.count).to eq(0)
    end
  end

end
