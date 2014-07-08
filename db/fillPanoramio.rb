require 'csv'
require 'uri'
require 'net/http'
require 'json'
require 'geocoder'
# original
# medium (default value)
# small
# thumbnail
# square
# mini_square
def getApiString(url,*args)
  url="#{url}?"
  args.each {|arg|url += "#{arg}&" unless arg == "" }
  url = url.split(" ").join("%20")[0..-2]
  getJson(url)
end

def getJson(lookup_url)
  response = Net::HTTP.get_response(URI.parse(lookup_url))
  JSON.parse(response.body)
end


def seedPictures(coords,start,size)
  url="http://www.panoramio.com/map/get_panoramas.php"
  set="set=public"
  from="from=#{start}"
  to="to=#{start+100}"
  minx="minx=#{(coords[1].to_i)-0.3}"
  miny="miny=#{(coords[0].to_i)-0.3}"
  maxx="maxx=#{(coords[1].to_i)+0.3}"
  maxy="maxy=#{(coords[0].to_i)+0.3}"
  size="size=#{size}"
  mapfilter="mapfilter=true"
  puts 'doing api lookup'
  getApiString(url,set,from,to,minx,miny,maxx,maxy,size,mapfilter)
end
def makeImages(coords,size,ids,posittion=0)
  response = seedPictures(coords,posittion,size)
  puts 'api lookup donw'
  response["photos"].each do |photo|
    if photo['width'] > photo['height']
      ids << [photo['photo_id'],photo['photo_file_url'],photo['latitude'],photo['longitude']]
    end
  end
  puts 'return ids'
  return ids
end

def getImages(city,size)
  if city.images.length < 10
  ids = []
  images
  coords = [city.latitude,city.longitude]
  newImages = makeImages(coords, size, ids, city.images.length)
  puts $photooooos
  puts newImages.length
  newImages.each do |image|
    city.images << Image.create(original_image_url:image[1],medium_image_url:image[1].gsub('original','medium'), smaal_image_url:image[1].gsub('original','smaal'), latitude:image[2], longitude:image[3], panoramio_id:image[0])
  end
end
end
$image_num = 0
def add_images
  City.all.each_with_index do |city,i|
    puts "importing images for city number:#{i}(#{city.name})"
    getImages(city, 'original')
  end
end