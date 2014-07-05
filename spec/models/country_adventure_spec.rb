require 'rails_helper'

describe CountryAdventure do
	it "should link the country and adventure pages"
		expect(country.adventure).to exist
	end
end
