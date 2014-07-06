require 'csv'

adventures = []
puts "Finding duplicates of adventures"
CSV.foreach("db/dbfiles/adventure.csv") do |csv|
	adventures << {id:csv[0],name:csv[1],description:csv[2],duration:csv[3],image_url:csv[4],map_url:csv[5],city_id:csv[6]}
end
duplicate_adventures = {}
duplicate_images = {}
adventures.each do |adventure|
	duplicate_adventures[adventure[:id]] = []
	duplicate_images[adventure[:id]] = []
	adventures.each do |test_adventure|
		if adventure[:name] == test_adventure[:name] && adventure[:id] != test_adventure[:id]
			duplicate_adventures[adventure[:id]] << test_adventure
		end
		if adventure[:image_url] == test_adventure[:image_url] && adventure[:id] != test_adventure[:id]
			duplicate_images[adventure[:id]] << test_adventure
		end
	end
end
duplicate_adventures.each_with_index do |hash, index|
	if hash[1] == []
		duplicate_adventures.delete(hash[0])
	end
end
duplicate_images.each_with_index do |hash, index|
	if hash[1] == []
		duplicate_images.delete(hash[0])
	end
end
# puts "We have #{duplicate_adventures.length} duplicated adventures in our database"
puts "We have #{duplicate_images.length} duplicated images in our database"
duplicate_adventures.each do |id,hash|
	ids = []
	hash.each do |duplicate|
		ids << duplicate[:id]
	end
	# puts "\nid: #{id} have #{hash.length} duplicates, the duplicate ids is: #{ids.join(",")}"
end

duplicate_images.each do |id,hash|
	ids = []
	hash.each do |duplicate|
		ids << duplicate[:id]
	end
	puts "\nid: #{id} have #{hash.length} image duplicates, the duplicate ids is: #{ids.join(",")}"
end