class Admin::ReviewsController < ApplicationController
  def show
    @tourist_spot = TouristSpot.find(params[:tourist_spot_id])
    @review = Review.find(params[:id])
    @comments = Comment.where(review_id: @review.id)
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_tourist_spot_path(@review.tourist_spot_id)
  end
end
