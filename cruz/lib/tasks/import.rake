require 'csv'

desc "Import Geolocations from csv file"
task :import => [:environment] do

	file = "db/KyleTest.csv"

	CSV.foreach(file, :headers => true) do |row|
		Geoloc.create({
		:latitude => row[0],
		:longitude => row[1],
		:address => row[2],
		:city => row[3],
		:state => row[4],
		:zip => row[5],
		})
	end
end