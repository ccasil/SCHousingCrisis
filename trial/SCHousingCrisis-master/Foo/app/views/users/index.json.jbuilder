json.array!(@users) do |user|
  json.extract! user, :id, :latitude, :longitude, :name, :address, :city, :zip, :gender, :rentPerMonth, :phone, :email
  json.url user_url(user, format: :json)
end
