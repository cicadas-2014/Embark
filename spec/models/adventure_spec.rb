require 'rails_helper'

describe "Adventure" do
  before(:each) do
    Adventure.create( name: "Jarkata", 
                      description: "capital", 
                      duration: 3, 
                      map_url: "google.maps.com", 
                      image_url: "google.images.com" )
  end

  it "is invalid without a name" do
    expect(Adventure(:name)).to exist
  end

  it "is invalid without a description" do
    expect(Adventure(:description)).to exist
  end

  it "is invalid without a duration" do
    expect(Adventure(:duration)).to exist
  end

  it "is invalid without a map_url" do
    expect(Adventure(:map_url)).to exist
  end

  it "is invalid without a image_url" do
    expect(Adventure(:image_url)).to exist
  end

end