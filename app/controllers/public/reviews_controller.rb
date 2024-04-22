class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
    @tourist_spot = TouristSpot.find(params[:tourist_spot_id])
  end
  
  def show
    @review = Review.find(params[:tourist_spot_id])
    @comments = Comment.where(review_id: @review.id)
  end
  
  def check
    @review = Review.new(review_params)
    @review_new = Review.new(review_params)
  end
  
  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to tourist_spot_reviews_completion_path
    else
      render :new
    end
  end
  
  def completion
  end
  
  private
  
  def review_params
    params.require(:review).permit(:customer_id, :tourist_spot_id, :image, :evaluation, :thoughts)
  end
  
end
