require 'uri'
require 'net/http'
require 'json'
require 'geocoder'
def coords_from_address(address)
	geo = Geocoder.search(address).first
	return [geo.latitude,geo.longitude]
end
$number = 0
def seedPictures(coords,start)
	url="http://www.panoramio.com/map/get_panoramas.php"
	set="set=public"
	from="from=#{start}"
	to="to=#{start+100}"
	minx="minx=#{coords[1].-0.3}"
	miny="miny=#{coords[0].-0.3}"
	maxx="maxx=#{coords[1].+0.3}"
	maxy="maxy=#{coords[0].+0.3}"
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
def loopPages(coords,urls,posittion=0)
	response = seedPictures(coords,posittion)
	response["photos"].each do |photo_url|
		p $number
		$number += 1
		urls << photo_url["photo_file_url"]
	end
	return urls unless response['has_more']
	urls = loopPages(coords,urls,posittion+100)
end

def getPictures(city)
	urls = []
	coords = coords_from_address(city)
	loopPages(coords,urls)
end

x = getPictures('New York')
p x
p x.length




