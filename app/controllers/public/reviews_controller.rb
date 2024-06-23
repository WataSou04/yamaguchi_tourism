class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @tourist_spot = TouristSpot.find(params[:tourist_spot_id])
  end
  
  def show
    @tourist_spot = TouristSpot.find(params[:tourist_spot_id])
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(review_id: @review.id)
  end
  
  def check
    @review = Review.new(review_params)
    @review_new = Review.new(review_params)
  end
  
  def create
    @tourist_spot = TouristSpot.find(params[:tourist_spot_id])
    @review = Review.new(review_params)
    if @review.save
      redirect_to tourist_spot_review_path(@review.tourist_spot.id, @review.id)
    else
      render :new
    end
  end
  
  def completion
  end
  
  private
  
  def review_params
    params.require(:review).permit(:customer_id, :tourist_spot_id, :title, :image, :evaluation, :thoughts)
  end
  
end
