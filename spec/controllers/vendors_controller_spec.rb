require 'rails_helper'

RSpec.describe VendorsController, type: :controller do
  let(:vendor) { FactoryGirl.create(:vendor) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: vendor.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'updates a couple' do
      update_params = { id: vendor.id, vendor: { name: 'Hello!' } }
      put :update, update_params
      vendor.reload
      expect(vendor.name).to eq('Hello!')
    end
  end

  describe 'GET #sort by type' do
    it 'returns vendors within a category' do
      create_list(:vendor, 5, category: 'Attire')
      get :sort_by_type, { vendor: { category: 'Attire' } }
      expect(Vendor.attires.count).to eq(5)
    end
  end
end
