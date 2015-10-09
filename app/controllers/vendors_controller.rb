class VendorsController < ApplicationController
  before_action :authenticate_vendor!

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @approved_contracts = @vendor.approved_contracts
    @need_approval_contracts = @vendor.need_approval_contracts
    @pending_contracts = @vendor.pending_contracts
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :type, :address, :website, :phone, :email, :password)
  end
end
