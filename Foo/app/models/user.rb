class User < ActiveRecord::Base
	
	def self.search(search)
		if search
			where("street LIKE ? OR city LIKE ? OR zip LIKE ? " , "%#{search}%","%#{search}%", "%#{search}%")
		else
			self.all
		end
	end


	acts_as_votable

	def score
		self.get_upvotes.size - self.get_downvotes.size
	end

	geocoded_by :address
		def address
			[street, city, zip].compact.join(',')
			end
	after_validation :geocode

end
