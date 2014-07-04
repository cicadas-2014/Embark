# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'net/http'

url = "https://rest.gadventures.com/tours"
credentials = "#{"X-Application-Key"}:#{live_0ed49b6452ad05041e52d88b6893bf0f4d0a7b7e}"
RestClient.post "https://credentials@#{url}", '<hello xmlns="https://rest.gadventures.com/tours"/>'


# url = 'https://rest.gadventures.com/tours'
# mykey = 'live_0ed49b6452ad05041e52d88b6893bf0f4d0a7b7e'
# uri = URI.parse(url)

# request = Net::HTTP.get_response(uri).body
# p request
# request['X-Application-Key'] = mykey

# response = Net::HTTP.new(uri.host,uri.port) do |http|
#   http.request(request)
# end

<<<<<<< HEAD
# p response.inspect
=======
# p response.inspect
=======
require 'csv'


@adventures = []
CSV.foreach('db/adventures.csv') do |row|
  @adventures << row
end

@sliced = @adventures.each_slice(5)
@sliced.each do |s|
  @adventure = Adventure.create(name: s[0][0], duration: s[2][0].to_i, description: s[3][0])
  @country = Country.create(name: s[1][0])
  CountryAdventure.create(country_id: @country.id, adventure_id: @adventure.id)
  Image.create(url: s[4][0], adventure_id: @adventure.id)
end
>>>>>>> master
