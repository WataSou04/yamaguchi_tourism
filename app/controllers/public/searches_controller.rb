class Public::SearchesController < ApplicationController
  def search
    @content = params[:content]
    @method = params[:method]
    @tourist_spots = TouristSpot.search_for(@content, @method)
  end
end
