class VendorsController < ApplicationController
  before_action :authenticate_vendor!, except: [:home, :about]

  def index
    @vendors = Vendor.all
  end

  def show
    @vendors = Vendor.find(params[:id])
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :description, :type, :address, :website, :phone, :email, :password)
  end
end
