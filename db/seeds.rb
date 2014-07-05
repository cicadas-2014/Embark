require 'csv'
require 'uri'
require 'net/http'
require 'json'
require 'geocoder'

def coords_from_address(address)
  geo = Geocoder.search(address).first
  return [geo.latitude,geo.longitude]
end
def seedPictures(coords,start)
  url="http://www.panoramio.com/map/get_panoramas.php"
  set="set=public"
  from="from=#{start}"
  to="to=#{start+30}"
  minx="minx=#{(coords[1].to_i)-0.3}"
  miny="miny=#{(coords[0].to_i)-0.3}"
  maxx="maxx=#{(coords[1].to_i)+0.3}"
  maxy="maxy=#{(coords[0].to_i)+0.3}"
  size="size=original"
  mapfilter="mapfilter=true"
  getApiString(url,set,from,to,minx,miny,maxx,maxy,size,mapfilter)
end
def getApiString(url,*args)
  url="#{url}?"
  args.each {|arg|url += "#{arg}&" unless arg == "" }
  url = url.split(" ").join("%20")[0..-2]
  getJson(url)
end
def getJson(lookup_url)
  uri = URI.parse(lookup_url)
  response = Net::HTTP.get_response(uri)
  JSON.parse(response.body)
end
def loopPages(coords,urls,posittion=0, page=0)
  response = seedPictures(coords,posittion)
  response["photos"].each do |photo|
    urls << [photo["photo_file_url"],photo["latitude"], photo["longitude"] ]
  end
  return urls #unless response['has_more'] || page < 1
  # urls = loopPages(coords,urls,posittion+100,page+=1)
end

def getImages(city)
  urls = []
  coords = [city.latitude,city.longitude]
  loopPages(coords,urls)
end

# x = getPictures('New York')

# Top 20 World Adentures
def top20
  adventures = []
  CSV.foreach('db/adventures.csv') do |row|
    adventures << row
  end

  sliced = adventures.each_slice(5)
  sliced.each do |s|
    adventure = Adventure.create(name: s[0][0], duration: s[2][0].to_i, description: s[3][0])
    country = Country.create(name: s[1][0])
    CountryAdventure.create(country_id: country.id, adventure: adventure)
  end
end

def make_countries
  CSV.foreach('db/countries.csv') do |country|
    country = country[0].split('|')
    Country.create(name: country[1], code: country[0])
  end
end

# G Adventure Tours
def gtours
  tours = []
  data_countries = []
  tours_countries = []
  num = 0
  CSV.foreach('db/gtours.csv') do |tour|
    puts "Adventure number #{num}" 
    num += 1
    tours << tour
    make_tour(tour)
    # sleep(0.1)
  end
end
def make_tour(tour)
  make_city(tour[4])
  city = City.find_by(name: tour[4])
  adventure = Adventure.find_or_create_by(name:tour[0], duration:tour[1],description:tour[2],city_id: city.id, map_url: tour[5], image_url: tour[6])
  categories = tour[3].gsub('[','').gsub(']','').gsub(' ','').gsub('"','').split(',')
  categories.each do |cat|
   category = Category.find_or_create_by(name:cat) unless cat.match(/\d/)
   CategoryAdventure.create(category: category, adventure: adventure)
 end
 add_image(adventure)
end
def make_city(city_name)
  city = City.find_by(name: city_name) 
  unless city
    geo = Geocoder.search(city_name).first
    City.create(name: city_name, country: Country.find_by(code: geo.country_code), latitude: geo.latitude, longitude: geo.longitude)
  end
end
$image_num = 0
def add_image(adventure)
  city = City.find(adventure.city_id)
  getImages(city).each do |image|
    $image_num += 1
    puts "Image number: #{$image_num}, city: #{city.name}, adventure name: #{adventure.name}"
    Image.create(url: image[0], latitude: image[1], longitude: image[2], adventure_id: adventure.id)
  end
end

make_countries
top20
gtours
