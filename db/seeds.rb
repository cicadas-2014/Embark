# require_relative 'export_to_csv'
require_relative 'import_export_csv'
require_relative 'fillPanoramio'
require_relative 'make_countries'
makeCountriesContinents
importGadventures
importImages
# add_images
# export_cities_to_csv


# export_images_to_csv



# require 'csv'
# def import_new_york_adventures
# 	adventures = []
# 	CSV.foreach('db/new_york_adventures.csv') do |row|
# 		adventures << row
# 	end
# 	sliced = adventures.each_slice(6)
# 	p adventures
# 	sliced.each do |ad|
# 		# p ad
# 		a = Adventure.create(name: ad[0].first, description: ad[3].first, duration: ad[2].first, map_url: ad[4].first, city_id: 151, image_url: ad[5].first)
#   end
# end



# import_new_york_adventures