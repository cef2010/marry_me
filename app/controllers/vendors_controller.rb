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

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_params)
      redirect_to vendor_path(@vendor)
    end
  end

  private

  def type
    Vendor.types.include?(params[:type]) ? params[:type] : "Vendor"
  end

  def vendor_params
    params.require(type.underscore.to_sym).permit(:name, :description, :type, :address, :website, :phone, :email, :password)
  end
end
