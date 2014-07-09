class AdminController < ApplicationController
	def index

		@adventures = Adventure.all
	end
	def show
		p params[:deleteAdventure]
		if params[:deleteAdventure]
			Adventure.destroy((params[:id].to_i-1))
		end
		if params[:deletePictures] && params[:deletePictures] != ""
			images = params[:deletePictures].split(',')
			images.each do |imageId| 
				x = Image.find(imageId)
				y = Image.where(url:x.url)
				y.each do |img|
					puts "#{'*'*5} #{img.url}"
					Image.destroy(img.id)
				end
			end
		end
		@adventure = Adventure.find(params[:id])
	end
end
