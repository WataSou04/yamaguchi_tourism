class Public::TouristSpotsController < ApplicationController
  def index
    @tourist_spots = TouristSpot.page(params[:page])
  end
  
  def show
    @tourist_spot = TouristSpot.find(params[:id])
    @review = Review.new
    @reviews = Review.where(tourist_spot_id: @tourist_spot.id)
  end
end
