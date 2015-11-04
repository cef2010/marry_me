class VendorsController < ApplicationController
  include MapHashBuilder

  def index
    @vendors = Vendor.all
    @hash = hash_on_index(@vendors)
    if Vendor.search(params[:search])
      @vendors = Vendor.search(params[:search]).order('name DESC')
      @hash = hash_on_index(@vendors)
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor_active = @vendor.active_contracts
    @vendor_requests = @vendor.request_contracts
    @vendor_pending = @vendor.pending_contracts
    @hash = build_hash(@vendor)
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    redirect_to vendor_path(@vendor) if @vendor.update(vendor_params)
  end

  def sort_by_type
    vendors = Vendor.where(category: params[:category])
    @hash = hash_on_index(vendors)
    render(partial: 'vendor_index_content', locals: { vendors: vendors,
                                                      hash: @hash })
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :category, :address,
                                   :website, :phone, :email, :password,
                                   :vendor_avatar, :city, :state, :zip)
  end
end
