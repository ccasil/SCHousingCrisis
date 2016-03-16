json.array!(@listings) do |listing|
  json.extract! listing, :id, :name, :phone, :email, :street, :city, :state, :zip, :priceperm, :latitude, :longitude, :description
  json.url listing_url(listing, format: :json)
end
