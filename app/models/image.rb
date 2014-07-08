class Image < ActiveRecord::Base
	validates :medium_image_url, uniqueness: true
	validates :small_image_url, uniqueness: true

	belongs_to :city
end
