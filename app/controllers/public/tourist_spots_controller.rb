class Public::TouristSpotsController < ApplicationController
  def index
    @tourist_spots = TouristSpot.page(params[:page])
  end
  
  def search
    @content = params[:content]
    @method = params[:method]
    @tourist_spots = TouristSpot.search_for(@content, @method)
  end
  
  def tagsearch
    @model = TouristSpot
    @word = params[:content]
    @tourist_spots = TouristSpot.where("category LIKE?","%#{@word}%")
  end
  
  def show
    respond_to do |format|
      format.html do
        @tourist_spot = TouristSpot.find(params[:id])
        @reviews = Review.where(tourist_spot_id: @tourist_spot.id)
        @customer = current_customer
      end
      format.json do
        @tourist_spot = [TouristSpot.find(params[:id])]
      end
    end
  end
end