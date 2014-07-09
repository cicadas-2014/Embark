class EmbarkController < ApplicationController

	def home

	end

	def adventures
		latitude = params[:latitude]
		longitude = params[:longitude]
		search = params[:search]

		distance = 8 if search == 'local'
		distance = 20 if search == 'continential'
		if search != 'global'
			valid_adventures = []
			all_adventures = Adventure.all
			all_adventures.each do |adv|
				unless adv.image_url == "nil" || adv.image_url == "Private photo cant use"
					if adv.city_id
						city = City.find(adv.city_id)
						position = [city.latitude, city.longitude]
						if city.latitude.to_i - latitude.to_i+distance < distance*2 && city.latitude.to_i - latitude.to_i+distance > 0 && city.longitude.to_i - longitude.to_i+distance < distance*2 && city.longitude.to_i - longitude.to_i+distance > 0
							valid_adventures << adv
						end
					end
				end
			end
		else
			valid_adventures = Adventure.all
		end
		@categories = Category.all
		@adventures = valid_adventures.sample(27)
	end

	def description
		@adventure = Adventure.find_by(id: params[:adventure_id])
	end

end