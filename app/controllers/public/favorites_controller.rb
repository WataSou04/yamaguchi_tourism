class Public::FavoritesController < ApplicationController
  def create
    tourist_spot = TouristSpot.find(params[:tourist_spot_id])
    favorite = current_customer.favorites.new(tourist_spot_id: tourist_spot.id)
    favorite.save
    redirect_to tourist_spot_path(tourist_spot)
  end
  
  def destroy
    tourist_spot = TouristSpot.find(params[:tourist_spot_id])
    favorite = current_customer.favorites.find_by(tourist_spot_id: tourist_spot.id)
    favorite.destroy
    redirect_to tourist_spot_path(tourist_spot)
  end
end
