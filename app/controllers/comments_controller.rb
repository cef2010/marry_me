class CommentsController < ApplicationController

  def new
    @couple = Couple.find_by(id: params[:couple_id])
    @comment = @couple.comment.new
  end

  def create
    @couple = Couple.find_by(id: params[:couple_id])
    @comment = @couple.comments.new(comment_params)
    if @comment.save
      redirect_to couple_path(@couple)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :author, :vendor_id, :couple_id)
  end
end
