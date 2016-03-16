class Listing < ActiveRecord::Base

	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	
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
