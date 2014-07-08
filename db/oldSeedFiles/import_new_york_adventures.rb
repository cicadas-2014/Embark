require_relative 'new_york_adventures.csv'
require 'csv'
def import_new_york_adventures
	adventures = []
	CSV.foreach('db/new_york_adventures.csv') do |row|
		adventures << row
	end
	adventures = adventures.each_slice(6)

	adventures.each do |adventure|
		Adventure.create(name: adventure[0], description: adventure[3], duration: adventure[2], map_url: adventure[4], city: City.find(151), image_url: adventure[5])
  end
end