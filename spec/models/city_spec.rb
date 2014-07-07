require 'rails_helper'

RSpec.describe City, :type => :model do
  let(:city) {City.create(name:'New York', longitude: 5, latitude: 5, country_id: 5)}
  
  it "has a valid city" do
    expect(City.new()).to be_valid
  end

  it "have a name" do 
    expect(city).to respond_to(:name)
  end

  it "have a longitude" do 
    expect(city).to respond_to(:longitude)
  end

  it "have a latitude" do
    expect(city).to respond_to(:latitude)
  end

  it "have a country id" do 
    expect(city).to respond_to(:country)
  end
end
