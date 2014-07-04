require 'json'
require 'csv'
require 'curb'

c = Curl::Easy.new("https://rest.gadventures.com/activities")
c.headers["X-Application-Key"]="test_ab0d7ff525380c8a70af3c867e043cbcee926db3"
c.perform


x= JSON.parse(c.body_str)
p x
# x["results"].each do |a|
#   p  a["tour_dossier"]["name"]
# end


