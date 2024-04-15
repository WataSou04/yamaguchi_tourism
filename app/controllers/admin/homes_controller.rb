class Admin::HomesController < ApplicationController
  def top
    @tourist_spots = TouristSpot.page(params[:page])
  end
end
