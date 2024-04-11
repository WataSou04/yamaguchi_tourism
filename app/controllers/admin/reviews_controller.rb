class Admin::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @comments = Comment.where(review_id: @review.id)
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_tourist_spot(@review.tourist_spot_id)
  end
end
