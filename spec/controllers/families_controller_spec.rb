require 'rails_helper'

RSpec.describe FamiliesController, type: :controller do
  let(:couple) { FactoryGirl.create(:couple) }
  let(:family) { FactoryGirl.create(:family, couple_id: couple.id) }

  before(:each) do
    sign_in couple
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new, couple_id: couple.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, { couple_id: couple.id, id: family.id }
    end
  end

  describe 'PUT #update' do
    it 'updates a family' do
      put :update, { couple_id: couple.id, id: family.id, family: { name: 'Trevor' } }
      family.reload
      expect(family.name).to eq('Trevor')
      expect(Family.count).to eq(1)
    end
  end

  describe 'POST #create' do
    it 'creates a family' do
      create_params = { couple_id: couple.id, id: family.id, family: { name: 'Trevor' } }
      expect(Family.count).to eq(1)
      post :create, create_params
      expect(Family.count).to eq(2)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a family' do
      family
      expect(Family.count).to eq(1)
      delete :destroy, { couple_id: couple.id, id: family.id }
      expect(Family.count).to eq(0)
    end
  end
end
