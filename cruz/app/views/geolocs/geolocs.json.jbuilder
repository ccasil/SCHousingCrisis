json.array!(@geolocs) do |geoloc|
  json.extract! geoloc, :id
  json.url geoloc_url(geoloc, format: :json)
end
