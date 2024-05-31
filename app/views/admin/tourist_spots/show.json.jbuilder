json.data do
  json.items do
    json.array!(@tourist_spot) do |tourist_spot|
      json.id tourist_spot.id
      json.image url_for(tourist_spot.image)
      json.name tourist_spot.name
      json.explanation tourist_spot.explanation
      json.address tourist_spot.address
      json.category tourist_spot.category
      json.latitude tourist_spot.latitude
      json.longitude tourist_spot.longitude
    end  
  end
end