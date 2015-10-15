class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    @hash = Gmaps4rails.build_markers(@vendors) do |vendor, marker|
      if vendor.latitude != nil
        marker.lat vendor.latitude
        marker.lng vendor.longitude
      end
    end
    @hash.each do |h|
      if h = {}
        @hash.delete(h)
      end
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor_active = @vendor.active_contracts
    @vendor_requests = @vendor.request_contracts
    @vendor_pending = @vendor.pending_contracts
    @hash = Gmaps4rails.build_markers(@vendor) do |vendor, marker|
      marker.lat vendor.latitude
      marker.lng vendor.longitude
    end
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

  def sort_by_type(vendor_type)

  end

  private

  def type
    Vendor.types.include?(params[:type]) ? params[:type] : "Vendor"
  end

  def vendor_params
    params.require(type.underscore.to_sym).permit(:name, :description, :type, :address, :website, :phone, :email, :password, :vendor_avatar)
  end
end
