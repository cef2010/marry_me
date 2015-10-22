class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    @hash = Gmaps4rails.build_markers(@vendors) do |vendor, marker|
      if vendor.latitude != nil
        marker.lat vendor.latitude
        marker.lng vendor.longitude
        # marker.infowindow render_to_string(link_to: "#{vendor.name}", vendor_path(vendor))
        # marker.infowindow "#{vendor.name}, #{vendor.category}"
        marker.infowindow "index"
      end
    end
    @hash.each do |h|
      if h = {}
        @hash.delete(h)
      end
    end
    if Vendor.search(params[:search])
      @vendors = Vendor.search(params[:search]).order("name DESC")
      @hash = Gmaps4rails.build_markers(@vendors) do |vendor, marker|
        if vendor.latitude != nil
          marker.lat vendor.latitude
          marker.lng vendor.longitude
          marker.infowindow "<a href='/vendors/#{vendor.id}'>#{vendor.name}</a>, #{vendor.category}"
        end
      end
      @hash.each do |h|
        if h = {}
          @hash.delete(h)
        end
      end
    else
      @vendors = []
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

  def sort_by_type
    vendors = Vendor.where(category: params[:category])
    @hash = Gmaps4rails.build_markers(vendors) do |vendor, marker|
      if vendor.latitude != nil
        marker.lat vendor.latitude
        marker.lng vendor.longitude
        marker.infowindow "<a href='/vendors/#{vendor.id}'>#{vendor.name}</a>, #{vendor.category}"
      end
    end
    @hash.each do |h|
      if h = {}
        @hash.delete(h)
      end
    end
    render(partial: 'vendor_index_content', locals: {vendors: vendors, hash: @hash})
  end


  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :category, :address, :website, :phone, :email, :password, :vendor_avatar, :city, :state, :zip)
  end
end
