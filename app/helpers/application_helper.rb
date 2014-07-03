module ApplicationHelper
	user_location
		geo = Geocoder.search(request.remote_ip).first
		return [geo.latitude,geo.longitude]
	end

	coords_from_address(address)
		geo = Geocoder.search(address).first
		return [geo.latitude,geo.longitude]
	end

	address_from_coords(latitude,longitude)
		geo = Geocoder.search([latitude,longitude]).first
		geo.formatted_address
	end

	city_from_coords(latitude,longitude)
		geo = Geocoder.search([latitude,longitude]).first
		geo.city
	end

	country_from_coords(latitude,longitude)
		geo = Geocoder.search([latitude,longitude]).first
		geo.country
	end
end
