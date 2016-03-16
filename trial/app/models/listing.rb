class Listing < ActiveRecord::Base
	acts_as_votable
	belongs_to :user

	def self.search(search)
		if search
			where("street LIKE ? OR city LIKE ? OR zip LIKE ? " , "%#{search}%","%#{search}%", "%#{search}%")
		else
			self.all
		end
	end

	geocoded_by :address
		def address
			[street, city, zip].compact.join(',')
			end
	after_validation :geocode
end
