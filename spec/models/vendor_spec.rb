require 'rails_helper'
RSpec.describe Vendor, type: :model do

  describe "tests model attributes" do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :category }
    it { should respond_to :address }
    it { should respond_to :city }
    it { should respond_to :state }
    it { should respond_to :zip }
    it { should respond_to :website }
    it { should respond_to :phone }
    it { should have_many :couples }
    it { should have_many :contracts }
    it { should respond_to :latitude }
    it { should respond_to :longitude }
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

    it 'returns full address' do
      vendor
      expect(vendor.full_address).to eq("Vendor, Vendor, Vendor")
    end

    it 'queries a vendor name or category' do
      bakers = create_list(:vendor, 5, category: 'Baker')
      different_vendors = create_list(:vendor, 5, name: 'Bob')
      expect(Vendor.search("Baker").count).to eq(5)
      expect(Vendor.search("Bob").count).to eq(5)
    end

    it 'returns the correct types' do
      expect(Vendor.categories).to eq(['Music', 'Venue', 'Florist', 'Baker', 'Caterer', 'Photographer', 'Videographer', 'Photobooth', 'Invitation', 'Rental', 'Attire', 'Other'])
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
      attire = FactoryGirl.create(:vendor, category: 'Attire')
      expect(Vendor.attires.count).to eq(1)
    end

    it 'return all bakers' do
      photographer = FactoryGirl.create(:vendor, category: 'Baker')
      expect(Vendor.bakers.count).to eq(1)
    end

    it 'return all caterers' do
      photographer = FactoryGirl.create(:vendor, category: 'Caterer')
      expect(Vendor.caterers.count).to eq(1)
    end

    it 'return all florists' do
      photographer = FactoryGirl.create(:vendor, category: 'Florist')
      expect(Vendor.florists.count).to eq(1)
    end

    it 'return all invitations' do
      photographer = FactoryGirl.create(:vendor, category: 'Invitation')
      expect(Vendor.invitations.count).to eq(1)
    end

    it 'return all mucisians' do
      photographer = FactoryGirl.create(:vendor, category: 'Music')
      expect(Vendor.musics.count).to eq(1)
    end

    it 'return all type other vendors' do
      photographer = FactoryGirl.create(:vendor, category: 'Other')
      expect(Vendor.others.count).to eq(1)
    end

    it 'return all photobooths' do
      photographer = FactoryGirl.create(:vendor, category: 'Photobooth')
      expect(Vendor.photobooths.count).to eq(1)
    end

    it 'return all photographers' do
      photographer = FactoryGirl.create(:vendor, category: 'Photographer')
      expect(Vendor.photographers.count).to eq(1)
    end

    it 'return all rentals' do
      photographer = FactoryGirl.create(:vendor, category: 'Rental')
      expect(Vendor.rentals.count).to eq(1)
    end

    it 'return all venues' do
      photographer = FactoryGirl.create(:vendor, category: 'Venue')
      expect(Vendor.venues.count).to eq(1)
    end

    it 'return all videographers' do
      photographer = FactoryGirl.create(:vendor, category: 'Videographer')
      expect(Vendor.videographers.count).to eq(1)
    end
  end
end
