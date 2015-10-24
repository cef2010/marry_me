class CommentsController < ApplicationController
  def new
    @couple = Couple.find_by(id: params[:couple_id])
    @comment = @couple.comment.new
  end

  def create
    @couple = Couple.find_by(id: params[:couple_id])
    @comment = @couple.comments.new(comment_params)
    redirect_to couple_path(@couple) if @comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :author, :vendor_id, :couple_id)
  end
end
