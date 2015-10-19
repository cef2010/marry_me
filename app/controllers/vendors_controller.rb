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
    if params[:search]
      @vendors = Vendor.search(params[:search]).order("name DESC")
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
  # params[:type] = params[:type].to_sym
  # render json: { vendor: @vendor }

<<<<<<< HEAD
  def sort_by_type(vendor_type)
    Vendor.where(type: vendor_type)
=======
  def sort_by_type
    vendor = Vendor.where(category: params[:category])
    render json: { vendor: vendor }
>>>>>>> 96fccf30b2dcf70f2fe6e27c81fa0b1a8bef6a34
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :category, :address, :website, :phone, :email, :password, :vendor_avatar, :city, :state, :zip)
  end
end
