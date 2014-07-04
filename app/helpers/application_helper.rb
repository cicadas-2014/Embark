module ApplicationHelper
	def find_images_of topic
		# url_string = 'https://www.googleapis.com/freebase/v1/topic/en/' + topic + '?filter=/common/topic/image&limit=5'
		# p url_string
		# response = HTTParty.get(url_string)
		# p response.body
		# p JSON.parse(response)
		# p req.methods.sort
	end

	def user_location
		geo = Geocoder.search(request.remote_ip).first
		return [geo.latitude,geo.longitude]
	end

	def coords_from_address(address)
		geo = Geocoder.search(address).first
		return [geo.latitude,geo.longitude]
	end

	def address_from_coords(latitude,longitude)
		geo = Geocoder.search([latitude,longitude]).first
		geo.formatted_address
	end

	def city_from_coords(latitude,longitude)
		geo = Geocoder.search([latitude,longitude]).first
		geo.city
	end

	def country_from_coords(latitude,longitude)
		geo = Geocoder.search([latitude,longitude]).first
		geo.country
	end
end

