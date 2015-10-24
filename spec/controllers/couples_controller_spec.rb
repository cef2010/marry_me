require 'rails_helper'

RSpec.describe CouplesController, type: :controller do
  let(:couple) { FactoryGirl.create(:couple) }

  before(:each) do
    sign_in couple
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: couple.id
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT #update' do
    it 'updates a couple' do
      put :update, id: couple.id, couple: { description: 'hello' }
      couple.reload
      expect(couple.description).to eq('hello')
    end
  end
end
