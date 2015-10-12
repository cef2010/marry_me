class Contract < ActiveRecord::Base
  belongs_to :couple
  belongs_to :vendor

  def create_contract(couple, vendor, couple_bool, vendor_bool)
    Contract.create(couple_id: couple.id, vendor_id: vendor.id, couple_pending: couple_bool, vendor_pending: vendor_bool)
  end

  def approve_contract
    update_params = {couple_pending: false, vendor_pending: false}
    self.update(update_params)
  end
end
