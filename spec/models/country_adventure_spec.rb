require 'rails_helper'

RSpec.describe CountryAdventure, :type => :model do

 describe CountryAdventure do 
    it "should link the country and adventure tables" 
      expect(country.adventure).to exist
	end		
end
