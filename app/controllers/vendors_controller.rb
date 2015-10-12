class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor_active = @vendor.active_contracts
    @vendor_requests = @vendor.request_contracts
    @vendor_pending = @vendor.pending_contracts
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :type, :address, :website, :phone, :email, :password)
  end
end
