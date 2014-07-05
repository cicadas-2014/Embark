RSpec.describe Country, :type => :model do
  
require 'rails_helper'
    describe Country do 
     before(:each) do
    Country.create( name: 'Indonesia')
  end
      it "has a valid id" do
        expect(country.id).to exist
      end

      it "is invalid without a name" do
        expect(country.name).to exist
      end

      it "is invalid without a geolocation" do
        expect(country.geolocation).to exist
      end

      it "returns a country's full name as a string" do
        expect(country).to be_a(string)
      end
      end      
    end
end
