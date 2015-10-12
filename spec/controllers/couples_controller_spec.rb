require 'rails_helper'

RSpec.describe CouplesController, type: :controller do
  
  before(:each) do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it 'gets couples with active contracts' do
      get :show
  end

end
