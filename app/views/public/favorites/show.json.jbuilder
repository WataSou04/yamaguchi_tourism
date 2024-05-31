json.data do
  json.items do
    json.array!(@favorites) do |favorite|
      json.id favorite.tourist_spot.id
      json.image url_for(favorite.tourist_spot.image)
      json.name favorite.tourist_spot.name
      json.explanation favorite.tourist_spot.explanation
      json.address favorite.tourist_spot.address
      json.category favorite.tourist_spot.category
      json.latitude favorite.tourist_spot.latitude
      json.longitude favorite.tourist_spot.longitude
    end  
  end
end