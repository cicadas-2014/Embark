class EmbarkController < ApplicationController

	def home

	end

	def adventures
		p params
		if params[:search] == 'inspire'
			@adventures = []
			Adventure.all.each do |adv|
				unless adv.image_url == nil
					@adventures << adv
				end
			end
		else
			latitude = params[:latitude]
			longitude = params[:longitude]
			search = params[:search]
			
			distance = 8 if search == 'local'
			distance = 20 if search == 'continential'
			distance = 1000000 if search == 'global'

			valid_adventures = []
			p session
			if params[:category].nil?
				all_adventures = Adventure.all
			else
				par = JSON.parse(params[:params], symbol_names: true)
				latitude = par['latitude'].to_f
				longitude = par['longitude'].to_f
				all_adventures = Category.find(params[:category][:category_id]).adventures.all
				distance = 1000000				
			end
			all_adventures.each do |adv|
				if adv.city_id
					city = City.find(adv.city_id)
					position = [city.latitude, city.longitude]
					p '*' *100
					p distance
					if city.latitude.to_i - latitude.to_i+distance < distance*2 && city.latitude.to_i - latitude.to_i+distance > 0 && city.longitude.to_i - longitude.to_i+distance < distance*2 && city.longitude.to_i - longitude.to_i+distance > 0
						unless adv.image_url == "nil" || adv.image_url == "Private photo cant use"
							valid_adventures << adv
						end
					end
				end
			end
			@adventures = valid_adventures.sample(27)
			@params = params
		end
	end

	def description
		@adventure = Adventure.find_by(id: params[:adventure_id])
	end

end