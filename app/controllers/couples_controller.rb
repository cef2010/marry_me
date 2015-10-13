class CouplesController < ApplicationController

  def index
    @couples = Couple.all
  end

  def show
    @couple = Couple.find(params[:id])
    @couple_active = @couple.active_contracts
    @couple_requests = @couple.request_contracts
    @couple_pending = @couple.pending_contracts
    # render json: {name: @couple.name, description: @couple.description, wedding_date: @couple.wedding_date, budget: @couple.budget, ceremony_location: @couple.ceremony_location, reception_location: @couple.reception_location}
  end

  def edit
    @couple = Couple.find(params[:id])
  end

  def update
    @couple = Couple.find(params[:id])
     if @couple.update(couple_params)
      render json: { couple: @couple }
    else
      render 'edit'
    end
  end

	private
		def couple_params
			params.require(:couple).permit(:couple_id, :name, :description, :player1, :player2, :wedding_date, :budget, :ceremony_location, :reception_location, :email)
		end

end
