class CouplesController < ApplicationController

  def index
    @couples = Couple.all
  end

  def show
    @couple = Couple.find(params[:id])
    @couple_active = @couple.active_contracts
    @couple_requests = @couple.request_contracts
    @couple_pending = @couple.pending_contracts
    @comments = @couple.comments.all
    @comment = @couple.comments.new
    # render json: {name: @couple.name, description: @couple.description, wedding_date: @couple.wedding_date, budget: @couple.budget, ceremony_location: @couple.ceremony_location, reception_location: @couple.reception_location}
  end

  #No view so we don't need this?

  # def edit
  #   @couple = Couple.find(params[:id])
  # end

  def update
    @couple = Couple.find(params[:id])
     if @couple.update(couple_params)
       redirect_to couple_path(current_couple)
    else
      render 'edit'
    end
  end

	private
		def couple_params
			params.require(:couple).permit(:name, :description, :wedding_date, :budget, :ceremony_location, :reception_location, :email, :couple_avatar)
		end

    def comment_params
      params.require(:comment).permit(:body, :couple_id, :vendor_id, :author)
    end

end
