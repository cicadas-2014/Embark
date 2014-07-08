### Accessing the G Adventures API. Grabbing data on tour names, duration, descriptions, categories, 
### cities, visited countries, a map of the tour, and an image of the tour.
require 'json'
require 'csv'
require 'curb'
def curlRequest(url) # Making the request to the g adventures API
	curl = Curl::Easy.new(url)
	curl.headers["X-Application-Key"]=ENV['GADVENTURE_API_KEY']
	curl.perform
	JSON.parse(curl.body_str)
end

def getAdventures(url, adventuresUrls = []) #Retrieving the urls for all the adventures on every page
	results = curlRequest(url)
	results["results"].each do |tour|
    adventuresUrls << tour['tour_dossier']['href'] #pushing links from each adventure on the page into an array
  end
  if results['links'][0]['rel'] === 'prev'#stops recursion if on last page
  	return adventuresUrls
  end
  adventuresUrls = getAdventures(results['links'][0]['href'],adventuresUrls)#recursivly calls method to move on to the next page of requests
end

def SaveToCSV(data)
	CSV.open('db/csvFiles/gadventures.csv', 'a') do |csv|
		csv << data
	end
end

def dataRetrieval(url)
	data = ["","","","","","",[]]
	adventure_data = curlRequest(url)
  data[0] = adventure_data['name']
  data[1] = adventure_data['description']
  data[2] = adventure_data["geography"]["start_city"]["name"]
  data[3] = adventure_data['itineraries'][0]['duration'] if adventure_data['itineraries'][0]
  data[4] = adventure_data["images"][1]["image_href"] if adventure_data["images"][1]
  data[5] = adventure_data["images"][0]["image_href"] if adventure_data["images"][0]
  adventure_data['categories'].each {|cat| data[6] << cat["name"] if cat["name"]}  
  data.each do |info|
  	return nil unless info
	end
  return data
end  

def makeAdventuresCSV
	urls = getAdventures('https://rest.gadventures.com/tours') #starting collecting urls for data retrieval 
	last_adventure = ""
	urls.each_with_index do |url, i|
		data = dataRetrieval(url)
	  unless last_adventure == data.first || data == nil
	    puts "number #{i} of #{urls.length}"
	    SaveToCSV(data)
	  end
	  last_adventure = data.first
	end
end
