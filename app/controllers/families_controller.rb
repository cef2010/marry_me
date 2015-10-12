class FamiliesController < ApplicationController

  def new
  	@family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      redirect_to couple_path(current_couple)
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def update
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
