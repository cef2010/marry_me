class CouplesController < ApplicationController
	before_action :authenticate_couple!

  def index
    @couples = Couple.all
  end

  def show
    @couple = Couple.find(current_couple)
  end
end
