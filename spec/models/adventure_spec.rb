require 'rails_helper'

RSpec.describe Adventure, :type => :model do
  let(:adventure) {Adventure.create( name: "Jarkata", description: "capital", duration: 3, map_url: "google.maps.com", image_url: "google.images.com" )}

  it "has a valid adventure" do
    expect(Adventure.new()).to be_valid
  end

  it "is has a name" do
    expect(adventure).to respond_to(:name)
  end

  it "is has a description" do
    expect(adventure).to respond_to(:description)
  end

  it "is has a duration" do
    expect(adventure).to respond_to(:duration)
  end

  it "is has a map_url" do
    expect(adventure).to respond_to(:map_url)
  end

  it "is has a image_url" do
    expect(adventure).to respond_to(:image_url)
  end

end