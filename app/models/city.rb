class City < ActiveRecord::Base
	belongs_to :country
	
	has_many :adventure_cities
	has_many :cities, through: :adventure_cities
  has_many :images
end
