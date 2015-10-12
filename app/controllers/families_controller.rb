class FamiliesController < ApplicationController

  def new
    @couple = Couple.find(params[:couple_id])
  	@family = Family.new
  end

  def create
    @couple = Couple.find(params[:couple_id])
    @family = @couple.families.new(family_params)
    binding.pry
    if @family.save
      redirect_to couple_path(current_couple)
    end
  end

  def edit
    @couple = Couple.find(current_couple)
    @family = Family.find(params[:id])
  end

  def update
    @couple = Couple.find(current_couple)
    @family = Family.find(params[:id])
  	if @family.update(family_params)
  		redirect_to couple_path(current_couple)
    end
  end

  def destroy
    @family = Family.find(params[:id])
  	@family.destroy
    redirect_to couple_path(current_couple)
  end

  private

  def family_params
    params.require(:family).permit(:name, :description, :role, :relation, :contact)
  end
end
