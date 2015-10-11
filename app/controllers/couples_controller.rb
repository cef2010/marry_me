class CouplesController < ApplicationController
	before_action :authenticate_couple!

  def index
    @couples = Couple.all
  end

  def show
    @couple = Couple.find(current_couple)
  end

  def edit
    @couple = Couple.find(current_couple)
  end

  def update
    @couple = Couple.find(current_couple)
    if @couple.update(couple_params)
      redirect_to couple_path(current_couple)
    end
  end

	private
		def couple_params
			params.require(:couple).permit(:name, :description, :player1, :player2, :wedding_date, :budget, :ceremony_location, :reception_location, :email)
		end

end
