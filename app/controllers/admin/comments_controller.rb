class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
    redirect_to admin_tourist_spot_review_path(@review.tourist_spot_id, @review.id)
  end
end
