require 'rails_helper'

RSpec.describe Couple, type: :model do
  let(:couple) { FactoryGirl.create(:couple) }
  let(:contract) { FactoryGirl.create(:contract, couple_pending: false, vendor_pending: false) }
  let(:vendor) { FactoryGirl.create(:vendor) }

  describe 'model attributes' do
    it { should respond_to :description }
    it { should respond_to :name }
    it { should respond_to :wedding_date }
    it { should respond_to :budget }
    it { should respond_to :ceremony_location }
    it { should respond_to :reception_location }
    it { should have_many :contracts }
    it { should have_many :vendors }
  end

  describe 'model methods' do
    it 'returns contracts who have accepted a vendor contract' do
      couple.contracts << contract
      couple.contracts << FactoryGirl.create(:contract, couple_pending: true, vendor_pending: false)
      expect(couple.contracts.count).to eq(2)
      active = couple.active_contracts
      expect(active.count).to eq(1)
      expect(active.first[:couple_pending]).to be(false)
    end

    it 'returns contracts that have not been accepted by couple' do
      couple.contracts << contract
      couple.contracts << FactoryGirl.create(:contract, couple_pending: true, vendor_pending: false)
      expect(couple.contracts.count).to eq(2)
      request = couple.request_contracts
      expect(request.count).to eq(1)
      expect(request.first[:couple_pending]).to be(true)
    end

    it 'returns contracts that have been accepted by both sides' do
      couple.contracts << contract
      couple.contracts << FactoryGirl.create(:contract, couple_pending: false, vendor_pending: true)
      expect(couple.contracts.count).to eq(2)
      pending = couple.pending_contracts
      expect(pending.count).to eq(1)
      expect(pending.last[:couple_pending]).to be(false)
    end
  end
end
