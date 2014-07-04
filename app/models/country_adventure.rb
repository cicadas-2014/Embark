class CountryAdventure < ActiveRecord::Base
	belongs_to :country
	belongs_to :adventure
end
