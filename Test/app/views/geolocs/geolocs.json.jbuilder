json.array!(@geolocs) do |geoloc|
  json.extract! geoloc, :id, :address, :city, :state, :zip, :g_lat, :g_lon, :g_side, :g_type, :g_side
  json.url geoloc_url(geoloc, format: :json)
end
