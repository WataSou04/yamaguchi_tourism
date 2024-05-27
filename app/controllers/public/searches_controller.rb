class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @method = params[:method]
    @tourist_spots = TouristSpot.search_for(@content, @method)
  end
  
  def tagsearche
    @model = TouristSpot
    @word = params[:content]
    @tourist_spots = TouristSpot.where("category LIKE?","%#{@word}%")
    render "searches/tagsearch"
  end
  
end
