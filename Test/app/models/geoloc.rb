class Geoloc < ActiveRecord::Base
	Geoloc.select("address, g_lat, g_lon")
end
