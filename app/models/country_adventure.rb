class CountryAdventure < ActiveRecord::Base
  belongs_to :adventure
  belongs_to :country

end
