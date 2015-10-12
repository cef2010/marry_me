require 'rails_helper'
RSpec.describe Vendor, type: :model do

  describe "tests model attributes" do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :type }
    it { should respond_to :address }
    it { should respond_to :website }
    it { should respond_to :phone }
    it { should have_many :couples }
    it { should have_many :contracts }
  end


  describe "model methods" do
    let(:vendor) { FactoryGirl.create(:vendor) }
    let(:couple) { FactoryGirl.create(:couple) }
    let(:contracts) { create_list(:contract, 5, vendor_id: vendor.id, couple_id: couple.id) }
    let(:pending_contracts) { create_list(:contract, 5, vendor_id: vendor.id, couple_id: couple.id, couple_pending: true) }
    let(:requested_contracts) { create_list(:contract, 5, vendor_id: vendor.id, couple_id: couple.id, vendor_pending: true) }

    before(:each) do
      @vendor = vendor
    end

    # STI tests
    it 'returns the correct types' do
      expect(Vendor.types).to eq(['Music', 'Venue', 'Florist', 'Baker', 'Caterer', 'Photographer', 'Videographer', 'Photobooth', 'Invitations', 'Rentals', 'Attire', 'Other'])
    end

    it 'finds pending contracts' do
      pending_contracts
      expect(@vendor.pending_contracts.count).to eq(5)
    end

    it 'finds requested contracts' do
      requested_contracts
      expect(@vendor.request_contracts.count).to eq(5)
    end

    it 'finds active contracts' do
      contracts
      expect(@vendor.active_contracts.count).to eq(5)
    end

    it 'return all attire' do
      attire = FactoryGirl.create(:vendor, type: 'Attire')
      expect(Vendor.attires.count).to eq(1)
    end

    it 'return all bakers' do
      photographer = FactoryGirl.create(:vendor, type: 'Baker')
      expect(Vendor.bakers.count).to eq(1)
    end

    it 'return all caterers' do
      photographer = FactoryGirl.create(:vendor, type: 'Caterer')
      expect(Vendor.caterers.count).to eq(1)
    end

    it 'return all florists' do
      photographer = FactoryGirl.create(:vendor, type: 'Florist')
      expect(Vendor.florists.count).to eq(1)
    end

    it 'return all invitations' do
      photographer = FactoryGirl.create(:vendor, type: 'Invitations')
      expect(Vendor.invitations.count).to eq(1)
    end

    it 'return all mucisians' do
      photographer = FactoryGirl.create(:vendor, type: 'Music')
      expect(Vendor.musics.count).to eq(1)
    end

    it 'return all type other vendors' do
      photographer = FactoryGirl.create(:vendor, type: 'Other')
      expect(Vendor.others.count).to eq(1)
    end

    it 'return all photobooths' do
      photographer = FactoryGirl.create(:vendor, type: 'Photobooth')
      expect(Vendor.photobooths.count).to eq(1)
    end

    it 'return all photographers' do
      photographer = FactoryGirl.create(:vendor, type: 'Photographer')
      expect(Vendor.photographers.count).to eq(1)
    end

    it 'return all rentals' do
      photographer = FactoryGirl.create(:vendor, type: 'Rentals')
      expect(Vendor.rentals.count).to eq(1)
    end

    it 'return all venues' do
      photographer = FactoryGirl.create(:vendor, type: 'Venue')
      expect(Vendor.venues.count).to eq(1)
    end

    it 'return all videographers' do
      photographer = FactoryGirl.create(:vendor, type: 'Videographer')
      expect(Vendor.videographers.count).to eq(1)
    end
  end

end
