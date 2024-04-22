class Public::FavoritesController < ApplicationController
  def show
    respond_to do |format|
      format.html do
        @favorites = current_customer.favorites.page(params[:page])
      end
      format.json do
        @favorites = current_customer.favorites.all
      end
    end
  end
  
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
