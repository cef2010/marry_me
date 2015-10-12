class CouplesController < ApplicationController

  def index
    @couples = Couple.all
  end

  def show
    @couple = Couple.find(params[:id])
    @couple_active = @couple.active_contracts
    @couple_requests = @couple.request_contracts
    @couple_pending = @couple.pending_contracts
  end

  def edit
    @couple = Couple.find(params[:id])
  end

  def update
    @couple = Couple.find(params[:id])
    if @couple.update(couple_params)
      redirect_to couple_path(@couple)
    end
  end

	private
		def couple_params
			params.require(:couple).permit(:name, :description, :player1, :player2, :wedding_date, :budget, :ceremony_location, :reception_location, :email)
		end

end
