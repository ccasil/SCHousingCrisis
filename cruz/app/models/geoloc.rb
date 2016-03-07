class Geoloc < ActiveRecord::Base
	Geoloc.select("address, g_lat, g_lon")
	def self.search(search)
	  if search
		where("address LIKE ? OR city LIKE? OR state LIKE? OR zip LIKE?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%")

	  else
		self.all
	  
	 end
	end
end
