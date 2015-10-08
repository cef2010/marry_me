class ContractsController < ApplicationController
  before_action :find_contract, only: [:edit, :update, :destroy]
  def index
  	@contracts = current_couple.contracts
  end

  def new
  	@contract = Contract.new
  end

  def create
  	@contract = Contract.new(contract_params)
  	if @contract.save
  		redirect_to contracts_path
  	else
  		render 'new'
  	end
  end

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
  	redirect_to contracts_path
  end

  private
  	def find_contract
  		@contract = Contract.find(params[:id])
  	end

  	def contract_params
  		params.require(:contract).permit(:total, :couple_id, :vendor_id)
  	end
end
