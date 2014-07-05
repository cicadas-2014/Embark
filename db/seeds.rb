# require 'csv'


# @adventures = []
# CSV.foreach('db/adventures.csv') do |row|
#   @adventures << row
# end

# @sliced = @adventures.each_slice(5)
# @sliced.each do |s|
#   @adventure = Adventure.create(name: s[0][0], duration: s[2][0].to_i, description: s[3][0])
#   @country = Country.create(name: s[1][0])
#   CountryAdventure.create(country_id: @country.id, adventure_id: @adventure.id)
#   Image.create(url: s[4][0], adventure_id: @adventure.id)
# end

# require 'csv'
# require 'json'
# # Top 20 World Adentures
# def top20
#   adventures = []
#   CSV.foreach('db/adventures.csv') do |row|
#     adventures << row
#   end

#   sliced = adventures.each_slice(5)
#   sliced.each do |s|
#     @adventure = Adventure.create(name: s[0][0], duration: s[2][0].to_i, description: s[3][0])
#     @country = Country.create(name: s[1][0])
#     CountryAdventure.create(country_id: @country.id, adventure_id: @adventure.id)
#     Image.create(url: s[4][0], adventure_id: @adventure.id)
#   end
# end


# # G Adventure Tours
# def gtours
#   tours = []
#   @data_countries = []
#   @tours_countries = []

#   CSV.foreach('db/gtours.csv') do |row|
#     tours << row
#   end

# #countries
# tours.each do |t|
#   countries = t[8].gsub('[','').gsub(']','').gsub(' ','').gsub('"','').split(',')
#   @tours_countries << countries
#   @data_countries << countries
# end

# @data_countries = @data_countries.flatten.uniq
# @data_countries.each do |country|
#   c = Country.create(name: country)
# end

# #cities
# tours.each do |t|
#   country = Country.find_by(name:t[7])
#   city = City.find_or_create_by(name: t[4], country_id: country.id)  

# #adventure
#   adventure = Adventure.find_or_create_by(name:t[0], duration:t[1],description:t[2],city_id: city.id, map_url: t[5])
#   p adventure
# end
# #country adventure
# i = 0
# tours.each do |t|
#   @tours_countries[i].each do |country|
#     country_adventure = CountryAdventure.create(country:Country.find_by(name: country), adventure: Adventure.find_by(name:t[0]))
#   end
#   i += 1
# end
# #category and category adventure
# tours.each do |t|
#   categories = t[3].gsub('[','').gsub(']','').gsub(' ','').gsub('"','').split(',')
#   categories.each do |cat|
#     category = Category.find_or_create_by(name:cat) unless cat.match(/\d/)
#     catad = CategoryAdventure.create(category: category, adventure: Adventure.find_by(name:t[0]))
#   end
# end
# #image
# # tours.each do |t|
# #   image = Image.find_or_create_by(url: t[6])
# #   adventure = Adventure.find_by(name: t[0])
# #   country = Country.find_by(name: t[7])
# #   city = City.find_by(name:t[4])
# #   adventure.images << image
# #   country.images << image
# #   city.images << image
# # end
# end

# top20
# gtours
