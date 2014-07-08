require 'geocoder'
class Adventure < ActiveRecord::Base
	validates :image_url, uniqueness: true
	validates :title, uniqueness: true
	validates :description, uniqueness: true


	has_many :adventure_categories
	has_many :categories, through: :adventure_categories
	belongs_to :city

	def self.makeAdventure(title,description,start_city,duration,map_url=nil,image_url,categories, inCSV = false, csv = nil)
		####################
		# title: string
		# description: text
		# start_city: string
		# duration: integer
		# map_url: text
		# image_url: text
		####################
		sleep(0.1)
		city = City.find_by(name:start_city)
		unless city
			if inCSV
				City.create(name:start_city, longitude:csv[0], latitude:csv[1], country: csv[2])
			else
				geo = Geocoder.search(start_city).first
				country = Country.find_by(name:geo.country) 
				city = City.create(name:start_city, longitude:geo.longitude, latitude:geo.latitude, country: country)
			end
		end
		puts city.id
		adventure = Adventure.create(title:title, description:description, duration:duration, map_url:map_url, image_url:image_url)
		adventure.city = city
		categories = categories.gsub(/[\[\\\]" ]/,"").split(',').delete_if{ |cat| cat.match(/\d/) }
		categories.each do |category|
			adventure.categories << Category.find_or_create_by(name:category)
		end
	end
end
