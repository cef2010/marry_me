class VendorsController < ApplicationController
  before_action :authenticate_vendor!

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor_active = @vendor.approved_contracts
    @vendor_requests = @vendor.need_approval_contracts
    @vendor_pending = @vendor.pending_contracts
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :type, :address, :website, :phone, :email, :password)
  end
end
