require 'csv'

desc "Import Geolocations from csv file"
task :import => [:environment] do

	file = "db/KyleTest.csv"

	CSV.foreach(file, :headers => true) do |row|
		Geoloc.create({
		:address => row[0],
		:city => row[1],
		:state => row[2],
		:zip => row[3],
		:g_lat => row[4],
		:g_lon => row[5],
		:g_type => row[6],
		:g_side => row[7]
		})
	end
end