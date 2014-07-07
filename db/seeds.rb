require_relative 'export_to_csv'
require_relative 'seed_images_and_conections'
require_relative 'restore_db_from_csv'
restore_db_from_csv
top20
require 'csv'




require 'csv'
def import_new_york_adventures
	adventures = []
	CSV.foreach('db/new_york_adventures.csv') do |row|
		adventures << row
	end
	sliced_adventures = adventures.each_slice(6)

	sliced_adventures.each do |ad|
		# p ad
		Adventure.create(name: ad[0].first, description: ad[3].first, duration: ad[2].first, map_url: ad[4].first, city_id: 151, image_url: ad[5].first)
  end
end

import_new_york_adventures