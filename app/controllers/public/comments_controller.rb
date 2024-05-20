class Public::CommentsController < ApplicationController
  def new
    @comment = Comment.find(params[:id])
    @review = @comment.review.id
  end
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to tourist_spot_review_path(@comment.review.tourist_spot.id, @comment.review.id)
    else
      render template: "reviews/show"
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:customer_id, :review_id, :thoughts)
  end
end
