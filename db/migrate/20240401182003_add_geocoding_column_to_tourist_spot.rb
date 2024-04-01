class AddGeocodingColumnToTouristSpot < ActiveRecord::Migration[6.1]
  def change
    add_column :tourist_spots, :latitude, :float, null: false, default: 0
    add_column :tourist_spots, :longitude, :float, null: false, default: 0
  end
end
