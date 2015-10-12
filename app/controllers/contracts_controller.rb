class ContractsController < ApplicationController
  before_action :find_contract, only: [:edit, :update, :destroy]
  def index
  	@contracts = current_couple.contracts
  end

  def new
  	@contract = Contract.new
  end

  # def create
  # 	@contract = Contract.new(contract_params)
  # 	if @contract.save
  # 		redirect_to contracts_path
  # 	else
  # 		render 'new'
  # 	end
  # end

  def edit
  end

  def update
  	if @contract.update
  		redirect_to contracts_path
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@contract.destroy
    if current_vendor
      redirect_to vendor_path(current_vendor)
    else current_couple
      redirect_to couple_path(current_couple)
    end
  end

  def add_contract
    @couple = Couple.find(params[:couple_id])
    @vendor = Vendor.find(params[:vendor_id])
    @contract = Contract.new
    if current_vendor
      @contract.create_contract(@couple, @vendor, true, false)
      redirect_to couple_path(@couple)
    else current_couple
      @contract.create_contract(@couple, @vendor, false, true)
      redirect_to vendor_path(@vendor)
    end
  end

  def add_approval
    @contract = Contract.find(params[:contract_id])
    @contract.approve_contract
    if current_vendor
      redirect_to vendor_path(current_vendor)
    else current_couple
      redirect_to couple_path(current_couple)
    end
  end

  private
  	def find_contract
  		@contract = Contract.find(params[:id])
  	end

  	def contract_params
  		params.require(:contract).permit(:total, :couple_id, :vendor_id, :vendor_pending, :couple_pending)
  	end
end
