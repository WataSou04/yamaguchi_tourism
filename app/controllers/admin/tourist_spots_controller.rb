class Admin::TouristSpotsController < ApplicationController
  def new
    @tourist_spot = TouristSpot.new
  end
  
  def create
    @tourist_spot = TouristSpot.new(tourist_spot_params)
    if @tourist_spot.save
      redirect_to admin_tourist_spot_path(@tourist_spot.id)
    else
      render :new
    end
  end
  
  def show
    respond_to do |format|
      format.html do
        @tourist_spot = TouristSpot.find(params[:id])
        @reviews = Review.where(tourist_spot_id: @tourist_spot.id)
      end
      format.json do
        @tourist_spot = [TouristSpot.find(params[:id])]
      end
    end
  end
  
  def edit
    @tourist_spot = TouristSpot.find(params[:id])
  end
  
  def update
    @tourist_spot = TouristSpot.find(params[:id])
    if @tourist_spot.update(tourist_spot_params)
      redirect_to admin_tourist_spot_path(@tourist_spot.id)
    else
      render :edit
    end
  end
  
  def destroy
    @tourist_spot = TouristSpot.find(params[:id])
    @tourist_spot.destroy
    redirect_to admin_root_path
  end
  
  private
  
  def tourist_spot_params
    params.require(:tourist_spot).permit(:image, :name, :explanation, :address, :category)
  end
end
