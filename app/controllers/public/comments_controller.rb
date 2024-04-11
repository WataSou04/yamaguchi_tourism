class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @review = Review.find(params[:id])
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to tourist_spots_path
    else
      render :new
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:customer_id, :review_id, :thoughts)
  end
end
