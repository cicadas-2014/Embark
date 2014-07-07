class City < ActiveRecord::Base
	belongs_to :country
	has_many :adventures
  has_many :images
  
end
