require 'rails_helper'

RSpec.describe Contract, type: :model do
  describe 'test model attributes' do
    it { should respond_to :cost }
    it { should respond_to :couple_id }
    it { should respond_to :vendor_id }
    it { should respond_to :couple_pending }
    it { should respond_to :vendor_pending }
    it { should belong_to :couple }
    it { should belong_to :vendor }
  end

  describe 'model methods' do

    let(:vendor) { FactoryGirl.create(:vendor) }
    let(:couple) { FactoryGirl.create(:couple) }
    let(:contract) { FactoryGirl.create(:contract, vendor_id: vendor.id, couple_id: couple.id) }

    it 'creates a contract' do
      couple
      vendor
      contract
      @new_contract = contract.create_contract(couple, vendor, true, true)
      expect(@new_contract.couple_pending).to eq(true)
    end

    it 'updates a contract' do
      contract
      contract.approve_contract
      contract.reload
      expect(contract.couple_pending).to eq(false)
    end
  end
end
