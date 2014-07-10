class AdminController < ApplicationController
	def index
		# CSV.foreach('db/csvFiles/adminCities.csv') do |row|
		# 	adventures << row
		# end

		# CSV.open("db/csvFiles/adminCities.csv", "wb") do |csv|
		# 		csv << [image.panoramio_id,image.original_image_url,image.medium_image_url,image.small_image_url,image.longitude,image.latitude,image.city.name]
		# end

	@cities = City.all
end
def show
	p params[:deleteAdventure]
	if params[:deletePictures] && params[:deletePictures] != ""
		images = params[:deletePictures].split(',')
		images.each do |imageId| 
			if Image.exists?(imageId)
				Image.destroy(Image.find(imageId))
			end
		end
	end
	@city = City.find(params[:id])
end
end
