require 'csv'
def top20
  adventures = []
  CSV.foreach('db/adventures.csv') do |row|
    adventures << row
  end

  slice = adventures.each_slice(5)
  slice.each do |s|
    p s[4][0]
  end
end

def importGadventures
  puts "importing adventures"
  cities = {}
  CSV.foreach("db/csvFiles/cities.csv") do |csv|
    cities[csv[0]] = [csv[1], csv[2], csv[3]]
  end
  CSV.foreach("db/csvFiles/gadventures.csv") do |csv|
    cityBoolean = true
    unless cities[csv[2]]
      cityBoolean = false
      cities[csv[2]] = nil
    end

    Adventure.makeAdventure(csv[0],csv[1],csv[2],csv[3],csv[5],csv[4],csv[6],cityBoolean,cities[csv[2]])
  end

    CSV.foreach("db/csvFiles/new_york_adventures.csv") do |csv|
    cityBoolean = true
    unless cities[csv[2]]
      cityBoolean = false
      cities[csv[2]] = nil
    end
    
    Adventure.makeAdventure(csv[0],csv[1],csv[2],csv[3],csv[5],csv[4],csv[6],cityBoolean,cities[csv[2]])
  end

    CSV.foreach("db/csvFiles/continental.csv") do |csv|
    cityBoolean = true
    unless cities[csv[2]]
      cityBoolean = false
      cities[csv[2]] = nil
    end
    
    Adventure.makeAdventure(csv[0],csv[1],csv[2],csv[3],csv[5],csv[5],csv[6],cityBoolean,cities[csv[2]])
  end

  puts "done importing adventures"
end

def importImages
  x = 0
  puts "importing images"
  CSV.foreach("db/csvFiles/images.csv") do |csv|
    city = City.find_by(name:csv[6])
    if city
      p x += 1
      Image.create(panoramio_id:csv[0], original_image_url:csv[1],medium_image_url:csv[2],small_image_url:csv[3],longitude:csv[4],latitude:csv[6],city:city)
    end
  end
  puts "done importing images"
end

def export_images_to_csv
  puts "exporting images to a csv file"
  CSV.open("db/csvFiles/images.csv", "wb") do |csv|
    Image.all.each do |image|
      csv << [image.panoramio_id,image.original_image_url,image.medium_image_url,image.small_image_url,image.longitude,image.latitude,image.city.name]
    end
  end
end
def export_cities_to_csv
  puts "exporting images to a csv file"
  CSV.open("db/csvFiles/cities.csv", "wb") do |csv|
    City.all.each do |city|
      if city.country
        csv << [city.name,city.longitude,city.latitude,city.country.name]
      end
    end
  end
end
