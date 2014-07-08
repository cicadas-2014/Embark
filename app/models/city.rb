class City < ActiveRecord::Base
	validates :name, uniqueness: true

	belongs_to :country
	
	has_many :adventures
  has_many :images
end
