### Accessing the G Adventures API. Grabbing data on tour names, duration, descriptions, categories, 
### cities, visited countries, a map of the tour, and an image of the tour.


require 'json'
require 'csv'
require 'curb'

def CurlRequest(url) # Making the request to the g adventures API
  curl = Curl::Easy.new(url)
  curl.headers["X-Application-Key"]=ENV['GADVENTURE_API_KEY']
  curl.perform
  JSON.parse(curl.body_str)
end

def gAdveturesAddUrls(url, adventuresUrls = []) #Retrieving the urls for all the adventures on every page
  results = CurlRequest(url)
  puts url
  results["results"].each do |tour|
    adventuresUrls << tour['tour_dossier']['href'] #pushing links from each adventure on the page into an array
  end
  if results['links'][0]['rel'] === 'prev'#stops recursion if on last page
    return adventuresUrls
  end
    adventuresUrls = gAdveturesAddUrls(results['links'][0]['href'],adventuresUrls)#recursivly calls method to move on to the next page of requests
  end

  def SaveToCSV(data)
    CSV.open('db/gtours.csv', 'a') do |csv|
      csv << data
    end
  end

  def dataRetrieval(url)
    categories = []
    visited_countries = []
    duration = 'nil'
    image = 'nil'
    map = 'nil'
    adventure_data = CurlRequest(url)

    name = adventure_data['name']
    duration = adventure_data['itineraries'][0]['duration'] if adventure_data['itineraries'][0]
    description = adventure_data['description']
    adventure_data['categories'].each {|c| categories << c["name"]}  
    start_city = adventure_data["geography"]["start_city"]["name"]
    map = adventure_data["images"][0]["image_href"] if adventure_data["images"][0]
    image = adventure_data["images"][1]["image_href"] if adventure_data["images"][1]
    starting_country = adventure_data["geography"]["start_country"]["id"]
    adventure_data["geography"]["visited_countries"].each {|c| visited_countries << [c['id']]}


    return nil unless name
    return [name,duration,description,categories,start_city,map,image,starting_country,visited_countries]
  end  


urls = gAdveturesAddUrls('https://rest.gadventures.com/tours') #starting collecting urls for data retrieval 
last_name = ''
urls.each_with_index do |url, i|
    data = dataRetrieval(url)
    unless last_name == data.first
      puts "number #{i} of #{urls.length}"
      SaveToCSV(data)
    end
    puts last_name = data.first
end

