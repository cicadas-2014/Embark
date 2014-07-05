require 'rails_helper'
    describe City do
 
      it "has a valid city" do
        expect(city.new()).to be_valid
  	  end

      it "is invalid without a description" do 
        expect(city.description).to exist
      end

      it "is invalid without a city" do 
        expect(city.country).to exist
      end

      it "is invalid without an name" do
        expect(city.name).to exist
      end

      it "returns a city's full name as a string" do 
        expect(city.name).to be_a(string)
      end
  end
