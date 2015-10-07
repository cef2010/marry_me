class CouplesController < ApplicationController
  def index
    @couples = Couple.all
  end

  def show
    @couple = Couple.find(current_couple)
  end
end
