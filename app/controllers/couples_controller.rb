class CouplesController < ApplicationController
  before_action :authenticate_couple!, except: [:home, :about]

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

end
