require 'rails_helper'

RSpec.describe CouplesController, type: :controller do
  
  before(:each) do

  let(:couple) { FactoryGirl.create(:couple) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: couple.id}
      expect(response).to have_http_status(:success)
    end

    it 'gets couples with active contracts' do
      get :show
  end

  # need an edit view to test function
  # describe "GET #edit" do
  #   it 'finds the couple to edit' do
  #     couple
  #     get :edit, {id: couple.id}
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "PUT #update" do
  #   it 'updates a couple' do
  #     couple
  #     update_params = {id: couple.id, couple: {name: 'Updated Name'}}
  #     put :update, update_params
  #     couple.reload
  #     expect(couple.name).to eq('Updated Name')
  #   end
  # end
end
