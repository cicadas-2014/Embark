class EmbarkController < ApplicationController

	def home

	end

	def adventures
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

			valid_adventures = []

			if params[:category].nil?
				all_adventures = Adventure.all
			else
				par = JSON.parse(params[:params], symbol_names: true)
				latitude = par['latitude'].to_f
				longitude = par['longitude'].to_f
				all_adventures = Category.find(params[:category][:category_id]).adventures.all
			end

			valid_adventures = []

			if search == 'local'
				all_adventures.each do |adventure|
					if adventure.city_id
						city = City.find(adventure.city_id)
						distance = 8;
						if city.latitude.to_i - latitude.to_i+distance < distance*2 && city.latitude.to_i - latitude.to_i+distance > 0 && city.longitude.to_i - longitude.to_i+distance < distance*2 && city.longitude.to_i - longitude.to_i+distance > 0
							unless adventure.image_url == "nil" || adventure.image_url == "Private photo cant use"
								valid_adventures << adventure
							end
						end
					end
				end
			elsif search == 'continential'
				geo = Geocoder.search([latitude,longitude]).first
				continent = Country.find_by(name:geo.country).continent
				all_adventures.each do |adventure|
					if adventure.city.country
						if adventure.city.country.continent == continent
							valid_adventures << adventure
						end
					end
				end
			else 
				valid_adventures = all_adventures
			end


			@adventures = valid_adventures.sample(27)
			@params = params
		end
	end

	def description
		@adventure = Adventure.find_by(id: params[:adventure_id])
	end

end