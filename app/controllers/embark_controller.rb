class EmbarkController < ApplicationController

	def home

	end

	def adventures
		unless params[:search]
			params[:search] = 'global'
		end
		geo = Geocoder.search(request.remote_ip).first
		location = [geo.latitude,geo.longitude]

		distance = 3 if params[:search] == 'local'
		distance = 16 if params[:search] == 'continential'
		distance = 1000000 if params[:search] == 'global'

		valid_adventures = []
		all_adventures = Adventure.all
		all_adventures.each do |adv|
			if adv.city_id
				city = City.find(adv.city_id)
				possition = [city.latitude, city.longitude]
				if possition[0].to_i - location[0].to_i+distance < distance*2 && possition[0].to_i - location[0].to_i+distance > 0 && possition[0].to_i - location[1].to_i+distance < distance*2 && possition[0].to_i - location[1].to_i+distance > 0
					unless adv.image_url == "nil" || adv.image_url == "Private photo cant use"
						valid_adventures << adv
					end
				end
			end
		end
		@categories = Category.all
		@adventures = valid_adventures.sample(27)
	end

	def description
	end


end