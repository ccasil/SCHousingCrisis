# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Geoloc.create(address: '10, Manteca ct.', city: 'Sacramento', state: 'CA', zip: '95831', g_lat: '-126.2321', g_lon: '123.1222', g_type: 'L', g_side: 'L')